# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

RealLaw.destroy_all
Law.destroy_all
Player.destroy_all

real_law = RealLaw.create(real_id: 565315, name: "PL 5002/2013", type: "Projeto de Lei", number: 5002, year: 2013, proposition_date: "20/2/2013 17:26:00", excerpt: "Dispõe sobre o direito à identidade de gênero e altera o art. 58 da Lei nº 6.015 de 31 de dezembro de 1973.", description: "Projeto denonominado Lei João W. Nery, Lei de Identidade de Gênero.", regime: "Ordinária", appraisal: "Proposição Sujeita à Apreciação do Plenário", state: "Tramitando em Conjunto")

Law.create(title: "PL 5002/2013", type: "PL", excerpt: "Permitirá que a pessoa mude seu nome de acordo com o gênero que ela se identifica e não com seu sexo de nascimento, e permitirá maiores de 18 anos fazerem cirurgia de mudança de sexo sem obrigação de análise psicológica ou autorização judicial. ", description: "O projeto cria a Lei de Identidade de Gênero, também conhecida como Lei João W. Nery.\r\n\r\nToda a pessoa terá direito ao reconhecimento de sua identidade de gênero; deverá ser tratada de acordo com sua identidade de gênero e ser identificada dessa maneira nos instrumentos que creditem sua identidade pessoal a respeito dos prenomes, da imagem e do sexo com que é registrada neles.\r\n\r\nIdentidade de gênero é a vivência interna e individual do gênero tal como cada pessoa o sente, a qual pode corresponder ou não com o sexo atribuído após o nascimento, incluindo a vivência pessoal do corpo.\r\n\r\nToda a mudança de registro deve ser gratuita, mantendo os mesmos números de identificação (como número de RG e CPF) e não pode ter nos novos registros qualquer referência às identidades anteriores ou ao uso da Lei. Também não será dada nenhuma publicidade a essa mudança.\r\n\r\nA Lei permite também que toda pessoa, maior de 18 anos e capaz, possa requerer intervenções cirúrgicas de mudança de sexo, sem exigir análises ou tratamentos psicológicos, tampouco autorização judicial.\r\n\r\nSegundo os autores do projeto, Jean Willys e Érika Kokay, os empecilhos para a identificação legal daqueles que se sentem como pertencentes a outro gênero é mais um problema que leva a preconceitos e exclusão de transexuais, travestis, transgêneros e intersexuais. O projeto recebe o nome de “João W. Nery” em homenagem a um ex-professor universitário que teve de renunciar a toda sua vida, carreira, registros e diploma para ser tratado como homem, já que civilmente era registrado como mulher. A Lei, portanto, visa garantir direitos legais de registro e mudança de sexo a quem, no âmbito interno e pessoal, já vive em gênero diferente do que foi registrado ao nascer.", state: "Tramitando", real_law_id: real_law.id)

real_law = RealLaw.create(real_id: 576052, name: "PL 5527/2013", type: "Projeto de Lei", number: 5527, year: 2013, proposition_date: "8/5/2013 11:32:32", excerpt: "Altera a Lei nº 8.072, de 25 de julho de 1990.", description: "Enquadra na Lei dos Crimes Hediondos, os casos de depredação de bem público e altera a espécie de pena aplicável, aumentando, também, o seu período mínimo e máximo de incidência. Altera o Decreto-Lei nº 2.848, de 1940.", regime: "Prioridade", appraisal: "Proposição Sujeita à Apreciação do Plenário", state: "Tramitando em Conjunto")
Law.create(title: "PL 5527/2013", type: "PL", excerpt: "Tornará crime hediondo a depredação de patrimônio público (pichação), punindo com até 6 anos de prisão. ", description: "O projeto de lei tornará o crime de depredação de patrimônio público como crime hediondo, além de aumentar as penas.\r\n\r\nHoje, as penas vão de seis meses a 3 anos de prisão. O projeto elevará as penas para um a 6 anos de prisão.\r\n\r\nTornando o crime hediondo, fica mais difícil para o criminoso progredir de regime, com a aplicação da pena mais rígida.\r\n\r\nDe acordo com o deputado, são muitos os casos de pessoas que estragam o patrimônio público, destruindo, inutilizando, pichando, etc. Mas as penas não são suficientes, sendo necessário mais rigor para evitar esse tipo de crimes.", state: "Tramitando", real_law_id: real_law.id)
