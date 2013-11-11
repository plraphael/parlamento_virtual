Parlamento Virtual
==================

###### Torne-se um grande parlamentar e ajude a ditar os rumos da política nacional.


    
O que é?
--------
Uma aplicação web social em forma de jogo, onde o usuário assume o papel de um parlamentar e integra um congresso virtual, que funciona de maneira síncrona ao Congresso Nacional, através da integração com a API da Câmara. No congresso virtual, tramitam as mesmas leis que forem colocadas em pauta para discussão no Plenário, editadas pelos próprios usuários de maneira a facilitar o acesso aos textos. Todos os dias, os parlamentares virtuais podem votar e discutir projetos de lei de interesse nacional, inclusive propondo emendas ao texto, apreciadas por seus pares.

Além dos aspectos formais do dia-a-dia dos parlamentares, o jogo apresenta o novo parlamentar virtual aos bastidores do Congresso, através de mecanismos que conectam as votações virtuais a interesses antagônicos de terceiros, representados por organizações econômicas, religiosas e políticas, entre outras, em um sistema em que manter uma base de apoio é fundamental para a reeleição como parlamentar virtual.
    
Com o código totalmente aberto, pretendemos ser uma ferramente transparente, não só de informação em questões vitais à nação, mas também de aprendizado e aproximação entre o povo e os seus representantes, aumentando assim a força da democracia brasileira.



Como funciona
-------------
O jogo tem como personagem principal a figura do **parlamentar virtual** e suas interações com os diversos projetos de leis apresentados a ele, bem como a interação com os seus pares. No jogo, o parlamentar virtual possui um **nível**, calculado a partir de **pontos**. Os pontos são conferidos nas diversas interações possíveis entre o parlamentar e o sistema. O nível de um parlamentar expressa sua experiência nos temas relativos ao exercício de suas funções, como votar, propor emendas, ser membro de comissões, entre outras.

Assim que o parlamentar virtual se elege, ele possui nível 1. Neste nível, ele está apto a comparecer às sessões do congresso virtual, podendo, com isso, posicionar-se em relação a diversos projetos de lei (podendo alterar sua posição quantas vezes quiser), votar definitivamente nestes mesmos projetos (sem a possibilidade de alterar o voto posteriormente) e votar em emendas propostas por outros parlamentares. Todas essas ações conferem pontos, indicando que a experiência do parlamentar virtual aumenta a cada sessão.
    
Nos níveis superiores, novas ações são possíveis, como, por exemplo, a capacidade de propor novos projetos de lei. Os projetos de lei do Parlamento Virtual representam diretamente os projetos reais que tramitam no Congresso Nacional. No entanto, como muitas vezes estes têm textos de difícil leitura, esta ação permite que usuários mais experientes interpretem o texto e os disponibilizem em formato mais acessível, promovendo assim a colaboração entre os usuários, bem como a continuidade de funcionamento do sistema. 
    
Outra ação disponível a parlamentares mais experientes é a de propor emendas a projetos de lei, que serão apreciadas por todos os interessados. Emendas bem votadas e discutidas podem passar a integrar o texto do projeto de lei do Parlamento Virtual, possibilitando, posteriormente, a comparação entre a lei aprovada nas duas casas: a real e a virtual.
   
Note que qualquer parlamentar virtual pode atingir os níveis superiores, bastando, para isto, interagir com o sistema. Este sistema de pontuação garante não haver exclusão nenhuma entre os integrantes do sistema, princípio fundamental na garantia da transparência das informações apresentadas e dos resultados das votações.
    
Finalmente, temos o mecanismo que simula os bastidores do Congresso Nacional. Ao atingir determinado nível, o parlamentar virtual pode escolher seus **apoiadores**, representados por entidades das mais diversas naturezas, como econômicas, populares, sindicais, políticas, religiosas, entre outras. Estas entidades conferem **pontos de apoio** ao parlamentar que são essenciais para a manutenção do seu nível. Neste estágio, o parlamentar perde pontos de apoio caso se posicione de maneira contrária a algum de seus apoiadores em matérias relevantes. Se seus pontos de apoio cairem muito, sua reeleição está ameaçada, na forma da perda de níveis até que os apoios antigos sejam recuperados ou novos sejam negociados.
São exemplos de ações possíveis do parlamentar virtual:

- apresentar-se para as sessões diárias;
- posicionar-se e definir seu voto em projetos de lei;
- propor e votar emendas aos projetos de lei;
- criar novos projetos de lei;
- negociar e manter apoios com entidades que influenciam a política nacional.


Objetivos e métricas
--------------------

O objetivo principal do projeto é aproximar a população do processo legislativo como um todo, tanto através do conhecimento das questões discutidas diariamente na casa como através da exposição simplificada dos mecanismos que norteiam a tomada de decisões pelos parlamentares.

Entendemos que tal aproximação traz vários benefícios para a democracia brasileira, como:
- aumenta a compreensão da população em relação ao processo legislativo e seus bastidores;
- aumenta efetivamente a participação popular na tomada de decisões importantes para os rumos do país;
- permite um ambiente transparente de debate, onde os diferentes argumentos podem ser levantados e discutidos.


Da participação popular no sistema, várias métricas de interesse podem ser extraídas e usadas para reafirmar os objetivos discutidos acima. Entre elas, destacamos a possibilidade de alinhar os parlamentares virtuais com os reais, medida importante no processo de tomada de decisão por parte da população no momento eleitoral. Esta métrica se dá através da medida de similaridade entre as decisões tomadas pelos deputados reais e os virtuais, permitindo que o usuário veja de maneira fácil qual deputado tem visão mais próxima à sua.

Destacamos, também, métricas relacionadas às influências de terceiros no processo legislativo. Através de dados do sistema relacionados a esta influência, como a troca de posicionamento em um projeto de lei importante, podemos ter uma ideia da dimensão de tais práticas no Congresso Nacional e o quanto isto impacta na tomada de decisão dos deputados.

Muitas outras métricas serão possiveis, permitindo compreender melhor o panorama da política brasileira entendida pela própria população, e o contraste deste com o panorama entendido pelos seus representantes.


Trabalhos Futuros
-----------------

Novas ações podem ser incorporadas ao jogo com o objetivo de tornar o Parlamento Virtual mais próximo do real. Em particular, queremos iniciar discussões dentro do jogo sobre o **regimento interno** do Parlamento Virtual. Estas discussões dar-se-ão em dias em que não há sessão em plenário, por exemplo, nos finais de semana. Com esta ação, a própria organização do jogo estará nas mãos dos parlamentares virtuais, aumentando ainda mais a transparência do sistema.

A incorporação das comissões também é uma característica desejável no Parlamento Virtual. Usuários de níveis mais elevados poderiam ser indicados para as diversas comissões, onde os projetos de lei passam antes da ir para a votação em plenário. Os mecanismos que permitem esta característica ainda devem ser pensados, já que este é um aspecto complexo do processo legislativo.

Em relação às caracteristicas técnicas do sistema, trabalhos futuros incluem o aprimoramento em termos de eficiência, bem como desafios relacionados à usabilidade e acessibilidade.

Como colaborar com o projeto 
----------------------------

Críticas, dúvidas e sugestões são bem-vindas. Para colaborar com o código, as instruções de instalação em um servidor estão no README da pasta catalog-kitchen.





## Integrantes
- Carlos Eduardo Moreira dos Santos
- Fabricio Nascimento
- Pedro Luis Furio Raphael



