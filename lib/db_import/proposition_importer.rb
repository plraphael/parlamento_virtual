class PropositionImporter

  START_DATE = '14/10/2013'
  END_DATE = '18/10/2013'
  PROP_TYPES = [
    'MPV',
    'PEC',
    'PL',
    'PLC',
    'PLN',
    'PLOA',
    'PLP',
    'PLS',
    'PLV'
  ]

  def initialize
    @created = @updated = @total = 0
  end

  def import(start_date = nil, end_date = nil)
    if start_date == nil
      start_date = START_DATE
      end_date = END_DATE
    end
    year = start_date.split('/').last

    PROP_TYPES.each do |type|
      import_type_range(type, year, start_date, end_date)
    end

    puts "#{@total} law(s) processed. #{@created} new, #{@updated} updated."
  end

  def import_law(type, number, year)
    url = "http://www.camara.gov.br/SitCamaraWS/Proposicoes.asmx/ListarProposicoes?sigla=#{type}&numero=#{number}&ano=#{year}&datApresentacaoIni=&datApresentacaoFim=&autor=&parteNomeAutor=&siglaPartidoAutor=&siglaUFAutor=&generoAutor=&codEstado=&codOrgaoEstado=&emTramitacao="

    law = nil
    begin
      law = import_url(url)
    rescue OpenURI::HTTPError
      puts "Nothing found."
    end

    law
  end

  private

  def import_type_range(type, year, start_date, end_date)
    url = "http://www.camara.gov.br/SitCamaraWS/Proposicoes.asmx/ListarProposicoes?sigla=#{type}&numero=&ano=#{year}&datApresentacaoIni=#{start_date}&datApresentacaoFim=#{end_date}&autor=&parteNomeAutor=&siglaPartidoAutor=&siglaUFAutor=&generoAutor=&codEstado=&codOrgaoEstado=&emTramitacao="

    begin
      import_url(url)
    rescue OpenURI::HTTPError
      puts "No data for type #{type}"
    end

  end

  def import_url(url)
    xml = Nokogiri::XML(open(url))
    law = nil
    xml.xpath('//proposicao').each do |node|
      law = parse_law(node)

      if law.new_record?
        @created += 1
        puts "Law #{law.name} created"
      elsif law.changed?
        @updated += 1
        puts "Law #{law.name} updated"
      end

      @total += 1

      law.save
    end

    law
  end

  def parse_law(node)
    real_id = node.at('./id').text.strip.to_i
    law = RealLaw.find_or_initialize_by(real_id: real_id)
    law.name = node.at('./nome').text.strip
    law.type = node.at('./tipoProposicao/nome').text.strip
    law.number = node.at('./numero').text.strip
    law.year = node.at('./ano').text.strip
    law.proposition_date = node.at('./datApresentacao').text.strip
    law.excerpt = node.at('./txtEmenta').text.strip
    law.description = node.at('./txtExplicacaoEmenta').text.strip
    law.regime = node.at('./regime/txtRegime').text.strip
    law.appraisal = node.at('./apreciacao/txtApreciacao').text.strip

    node.xpath("./*[contains(name(), 'autor')]").each do |authorNode|
      law.real_authors << parse_author(authorNode)
    end

    law.last_expedition = parse_expedition(node)
    law.state = node.at('./situacao/descricao').text.strip

    law
  end

  def parse_author(node)
    author = RealAuthor.new

    author.name = node.at('./txtNomeAutor').text.strip
    author.party = node.at('./txtSiglaPartido').text.strip
    author.state = node.at('./txtSiglaUF').text.strip

    author
  end

  def parse_expedition(proposition)
    exp = Expedition.new

    exp.date = proposition.at('./ultimoDespacho/datDespacho').text.strip
    exp.description = proposition.at('./ultimoDespacho/txtDespacho').text.strip

    exp
  end
end
