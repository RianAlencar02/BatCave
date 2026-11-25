DROP DATABASE IF EXISTS BatCave;
CREATE DATABASE BatCave;
USE BatCave;


CREATE TABLE usuario (
    idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nomeUsuario VARCHAR(45),
    emailUsuario VARCHAR(45),
    senhaUsuario VARCHAR(20),
    cargoUsuario VARCHAR(15) DEFAULT 'comum',
    CONSTRAINT chCargo CHECK (cargoUsuario IN ('comum', 'administrador')),
    dataCriacao DATETIME DEFAULT CURRENT_TIMESTAMP
);
INSERt INTO usuario (nomeUsuario, emailUsuario, senhaUsuario, cargoUsuario) VALUES
('Rian Alencar', 'rian@adm.com', 'senhaadm123', 'administrador');

CREATE TABLE historia (
    idHistoria INT PRIMARY KEY AUTO_INCREMENT,
    tituloHistoria VARCHAR(100),
    resumoHistoria VARCHAR(200),
    anoHistoria YEAR,
    tipoHistoria VARCHAR(20),
    criadorHistoria VARCHAR(45),
    generoHistoria VARCHAR(30),
    universoHistoria VARCHAR(45),
    sinopseHistoria VARCHAR(1000),
    bannerHistoria VARCHAR(250),
    capaHistoria VARCHAR(250)
);

CREATE TABLE personagem (
    idPersonagem INT PRIMARY KEY AUTO_INCREMENT,
    nomePersonagem VARCHAR(45),
    resumoPersonagem VARCHAR(100),
    identidadeSecreta VARCHAR(45),
    categoriaPersonagem VARCHAR(45),
    primeiraAparicaoPersonagem VARCHAR(50),
    criadoresPersonagem VARCHAR(100),
    generoPersonagem VARCHAR(15),
    afiliacoesPersonagem VARCHAR(150),
    fraseMarcantePersonagem VARCHAR(100),
    biografiaPersonagem VARCHAR(500),
    bannerPersonagem VARCHAR(250),
    capaPersonagem VARCHAR(250)
);

CREATE TABLE historiasFavoritadas (
    idHistoriasFavoritadas INT  PRIMARY KEY AUTO_INCREMENT,
    fkUsuario INT,
    fkHistoria INT,
    CONSTRAINT fk_historiasFavoritadas_usuario FOREIGN KEY (fkUsuario) REFERENCES usuario(idUsuario),
    CONSTRAINT fk_historiasFavoritadas_historia FOREIGN KEY (fkHistoria) REFERENCES historia(idHistoria)
);


CREATE TABLE avaliacaoHistoria (
    idAvaliacaoHistoria INT PRIMARY KEY AUTO_INCREMENT,
    fkUsuario INT,
    fkHistoria INT,
    UNIQUE (fkUsuario, fkHistoria),
    notaAvaliacao INT,
    dataAvaliacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_avaliacaoHistoria_usuario FOREIGN KEY (fkUsuario) REFERENCES usuario(idUsuario),
    CONSTRAINT fk_avaliacaoHistoria_historia FOREIGN KEY (fkHistoria) REFERENCES historia(idHistoria)
);




CREATE TABLE personagensFavoritados (
    idPersonagensFavoritados INT PRIMARY KEY AUTO_INCREMENT,
    fkUsuario INT,
    fkPersonagem INT,
    CONSTRAINT fk_personagensFavoritados_usuario FOREIGN KEY (fkUsuario) REFERENCES usuario(idUsuario),
    CONSTRAINT fk_personagensFavoritados_personagem FOREIGN KEY (fkPersonagem) REFERENCES personagem(idPersonagem)
);

CREATE TABLE comentarioEditor (
    idComentarioEditor INT PRIMARY KEY AUTO_INCREMENT,
    textoComentarioEditor VARCHAR(1000),
    fkAdm INT,
    fkPersonagem INT,
    fkHistoria INT,
    CONSTRAINT fk_comentarioEditor_adm FOREIGN KEY (fkAdm) REFERENCES usuario(idUsuario),
    CONSTRAINT fk_comentarioEditor_personagem FOREIGN KEY (fkPersonagem) REFERENCES personagem(idPersonagem),
    CONSTRAINT fk_comentarioEditor_historia FOREIGN KEY (fkHistoria) REFERENCES historia(idHistoria)
);

CREATE TABLE quiz (
    idQuiz INT PRIMARY KEY AUTO_INCREMENT,
    fkHistoria INT,
    fkPersonagem INT,
    CONSTRAINT fk_quiz_historia FOREIGN KEY (fkHistoria) REFERENCES historia(idHistoria),
    CONSTRAINT fk_quiz_personagem FOREIGN KEY (fkPersonagem) REFERENCES personagem(idPersonagem)
);

CREATE TABLE pergunta (
  idPergunta    INT PRIMARY KEY AUTO_INCREMENT,
  textoPergunta VARCHAR(100),
  fkQuiz        INT NOT NULL,
  CONSTRAINT fk_pergunta_quiz FOREIGN KEY (fkQuiz) REFERENCES quiz(idQuiz)
);

CREATE TABLE alternativa (
  idAlternativa     INT PRIMARY KEY AUTO_INCREMENT,
  textoAlternativa   VARCHAR(100),
  alternativaCorreta TINYINT NOT NULL DEFAULT 0,
  fkPergunta         INT NOT NULL,
  CONSTRAINT fk_alternativa_pergunta FOREIGN KEY (fkPergunta) REFERENCES pergunta(idPergunta)
);

CREATE TABLE tentativa (
    idTentativa INT PRIMARY KEY AUTO_INCREMENT,
    pontuacao INT,
    fkUsuario INT,
    fkQuiz INT,
	dataTentativa DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_tentativa_usuario FOREIGN KEY (fkUsuario) REFERENCES usuario(idUsuario),
    CONSTRAINT fk_tentativa_quiz FOREIGN KEY (fkQuiz) REFERENCES quiz(idQuiz)
);

CREATE TABLE alternativaEscolhida (
    fkTentativa INT,
    fkAlternativa INT,
    PRIMARY KEY (fkTentativa, fkAlternativa),
    CONSTRAINT fk_alternativaEscolhida_tentativa FOREIGN KEY (fkTentativa) REFERENCES tentativa(idTentativa),
    CONSTRAINT fk_alternativaEscolhida_alternativa FOREIGN KEY (fkAlternativa) REFERENCES alternativa(idAlternativa)
);


INSERT INTO historia (tituloHistoria, resumoHistoria, anoHistoria, tipoHistoria, criadorHistoria, generoHistoria, universoHistoria, sinopseHistoria, bannerHistoria, capaHistoria) VALUES
(	'Batman Absoluto',
    'Um Bruce Wayne da classe trabalhadora enfrenta uma Gotham brutal sem sua fortuna.',
    2024,
    'Quadrinho',
    'Scott Snyder e Nick Dragotta',
    'Ação / Suspense',
    'Universo Absoluto',
'Em uma realidade moldada pela energia sombria de Darkseid, os pilares fundamentais do Cavaleiro das Trevas foram completamente subvertidos. Aqui, Bruce Wayne não é um bilionário filantropo: ele é um jovem engenheiro civil de 24 anos, criado no coração do perigoso distrito de Crime Alley, que carrega o trauma do assassinato de seu pai, um professor dedicado, durante uma excursão escolar. Sem a Mansão Wayne, sem acesso a tecnologias bilionárias e sem Alfred Pennyworth como mordomo — que nesta versão atua como um agente de inteligência implacável enviado para observar Gotham —, Bruce precisa confiar exclusivamente em sua força física descomunal, inteligência tática e equipamentos improvisados a partir de sua experiência na construção civil. Enfrentando a violenta e organizada gangue dos Animais, liderada pelo sádico Máscara Negra, este Batman surge como um símbolo bruto e implacável de resistência contra um sistema construído para esmagar os mais fracos.',	'./assets/imgs/historias/bannerBatmanAbs.jpeg',
    './assets/imgs/detalhesHistoria/capaDetalhes.webp'
),
(
    'Batman Contra o Capuz Vermelho',
    'Um vigilante letal domina o crime de Gotham e força Batman a encarar seu maior fracasso.',
    2010,
    'Filme',
    'Brandon Vietti e Judd Winick',
    'Ação / Drama',
    'DC Universe Animated Original Movies',
'Cinco anos após o brutal assassinato de Jason Todd, o segundo Robin, nas mãos do Coringa em Sarajevo, Batman continua assombrado pela culpa de não ter conseguido salvar seu antigo parceiro. A rotina de Gotham City vira de cabeça para baixo com a chegada do Capuz Vermelho, um misterioso e letal senhor do crime que reúne os principais chefões do tráfico sob uma regra rígida: ele controla os negócios, elimina quem desobedece e proíbe a venda de drogas para crianças. À medida que Batman e Asa Noturna investigam as operações desse novo antagonista — enfrentando até mesmo o mercenário Amazo e os capangas do Máscara Negra —, as habilidades marciais e o conhecimento tático do vilão revelam uma verdade devastadora. O confronto final força Bruce Wayne a encarar a ressurreição de Jason através do Poço de Lázaro e a responder à pergunta mais dolorosa de sua cruzada: por que o Coringa ainda está vivo?',    './assets/imgs/historias/bannerBatmanCapuzVermelho.avif',
    './assets/imgs/detalhesHistoria/capaContraCapuz.jpg'
),
(
    'Batman: Arkham Knight',
    'O Espantalho reúne os maiores vilões de Gotham para destruir o Cavaleiro das Trevas.',
    2015,
    'Jogo',
    'Rocksteady Studios',
    'Ação / Aventura',
    'Arkhamverse',
'Nove meses após a morte do Coringa e o fechamento da mega-prisão Arkham City, Gotham vive um período inédito de queda nos índices de criminalidade. No entanto, na noite de Halloween, o Espantalho retorna com uma nova e devastadora variante da toxina do medo, ameaçando detonar dispositivos químicos por toda a metrópole e forçando a evacuação imediata de seis milhões de civis. Com apenas criminosos, policiais e o próprio Batman restantes nas ruas tomadas pela chuva, o Cavaleiro das Trevas precisa enfrentar uma coalizão formada por Pinguim, Duas-Caras, Arlequina e Charada, todos financiados e coordenados por uma misteriosa força militar liderada pelo Cavaleiro de Arkham — um comandante tático que conhece cada movimento, fraqueza e equipamento do herói. Enquanto utiliza a versão mais avançada de seu traje e o recém-construído Batmóvel de combate, Bruce ainda luta contra a própria sanidade ao ser assombrado por alucinações contínuas do Coringa causadas pelo sangue infectado em suas veias.',	'./assets/imgs/historias/bannerBatmanArkham.jpg',
    './assets/imgs/detalhesHistoria/bannerBatmanArkham.jpg'
),
('Batman: Arkham Asylum',
    'Preso no Asilo Arkham, Batman precisa sobreviver a uma armadilha mortal preparada pelo Coringa.',
    2009,
    'Jogo',
    'Rocksteady Studios e Paul Dini',
    'Ação / Aventura',
    'Arkhamverse',
    'Após capturar o Coringa na Prefeitura de Gotham e escoltá-lo pessoalmente até o Asilo Arkham, Batman percebe que a rendição do vilão fazia parte de um plano meticulosamente arquitetado. Com a ajuda interna de Arlequina, o Palhaço Príncipe do Crime assume o controle total da ilha, liberta os criminosos mais perigosos da cidade e ameaça detonar bombas escondidas por toda Gotham caso alguém tente invadir o local. Isolado em meio a pacientes enlouquecidos e vilões como Espantalho, Hera Venenosa, Crocodilo e Bane, o Cavaleiro das Trevas precisa utilizar suas habilidades de detetive, furtividade e combate para impedir que o Coringa produza um exército de monstros através da fórmula experimental Titã.',
    './assets/imgs/historias/bannerBatmanArkhamAsylum.png',
    './assets/imgs/detalhesHistoria/capaBatmanArkhamAsylum.jpg'
),
(
    'Batman: Arkham City',
    'Encarcerado em uma megaprisão murada no coração de Gotham, Batman investiga o misterioso Protocolo 10.',
    2011,
    'Jogo',
    'Rocksteady Studios e Paul Dini',
    'Ação / Aventura',
    'Arkhamverse',
    'Um ano após os eventos no Asilo Arkham, o novo prefeito Quincy Sharp transforma os antigos bairros degradados de Gotham em Arkham City, uma gigantesca prisão a céu aberto cercada por muros impenetráveis e vigiada pelos mercenários da força militar TYGER. Quando Bruce Wayne é preso ao protestar publicamente contra o projeto, ele precisa vestir o manto do Batman para sobreviver às guerras de território entre Coringa, Pinguim e Duas-Caras. Enquanto corre contra o tempo para encontrar uma cura após ser infectado pelo sangue envenenado do Coringa, o herói precisa desvendar os planos sombrios do diretor Hugo Strange e impedir a execução do catastrófico Protocolo 10.',
    './assets/imgs/historias/bannerBatmanArkhamCity.png',
    './assets/imgs/detalhesHistoria/capaBatmanArkhamCity.jpg'
),
(
    'Batman: Arkham Origins',
    'Na véspera de Natal, um jovem Batman enfrenta oito assassinos contratados para eliminá-lo.',
    2013,
    'Jogo',
    'WB Games Montréal',
    'Ação / Aventura',
    'Arkhamverse',
    'Anos antes da ascensão dos maiores supervilões de Gotham, Bruce Wayne ainda é um vigilante em início de carreira, temido pelos criminosos e caçado como um fora da lei pela própria polícia corrupta da cidade. Na véspera de Natal, o poderoso chefão Máscara Negra oferece uma recompensa de cinquenta milhões de dólares pela cabeça do morcego, atraindo oito dos assassinos mais letais do mundo — incluindo Exterminador, Pistoleiro, Bane e Lady Shiva — para Gotham City. Ao longo de uma única noite congelante, Batman precisa sobreviver às emboscadas desses mercenários enquanto cruza pela primeira vez o caminho de um agente caótico que mudará sua vida para sempre: o Coringa.',
    './assets/imgs/historias/bannerBatmanArkhamOrigins.jpg',
    './assets/imgs/detalhesHistoria/capaBatmanArkhamOrigins.jpg'
),
(
    'Batman: Asilo Arkham',
    'Uma jornada psicológica e surreal pelos corredores mais sombrios da mente do Batman e de seus inimigos.',
    1989,
    'Quadrinho',
    'Grant Morrison e Dave McKean',
    'Terror / Psicológico',
    'Universo DC',
    'Liderados pelo Coringa, os internos do Asilo Arkham tomam o controle da instituição e fazem toda a equipe médica refém, exigindo apenas uma condição para libertá-los: que o Batman entre no asilo e passe uma noite entre eles. Ao atravessar os portões da antiga mansão fundada pelo perturbado Amadeus Arkham, o Cavaleiro das Trevas mergulha em um pesadelo claustrofóbico e simbólico. Confrontando reflexos distorcidos de sua própria sanidade através de encontros perturbadores com Duas-Caras, Chapeleiro Louco, Crocodilo e o próprio Coringa, Bruce Wayne precisa encarar seus traumas mais profundos para descobrir se realmente pertence ao lado de fora dos muros do hospício.',
    './assets/imgs/historias/bannerBatmanAsiloArkham.jpg',
    './assets/imgs/detalhesHistoria/capaBatmanAsiloArkham.jpg'
),
(
    'Batman: O Cavaleiro das Trevas',
    'Aos 55 anos, um Bruce Wayne aposentado retorna das sombras para salvar uma Gotham tomada pelo caos.',
    1986,
    'Quadrinho',
    'Frank Miller e Klaus Janson',
    'Ação / Distopia',
    'Terra-31',
    'Dez anos após aposentar o manto do morcego devido à morte de Jason Todd, um Bruce Wayne envelhecido e amargurado observa Gotham City sucumbir à violência extrema da gangue dos Mutantes em meio a uma onda de calor sufocante e tensões nucleares da Guerra Fria. Incapaz de ignorar o chamado de sua cidade, ele retorna à ativa ao lado de uma nova e destemida Robin, Carrie Kelley, despertando tanto a esperança dos cidadãos quanto a fúria de antigos inimigos como Duas-Caras e o Coringa. Considerado um divisor de águas nos quadrinhos, o confronto culmina em uma batalha épica entre o vigilante fora da lei e um Superman submisso às ordens do governo.',
    './assets/imgs/historias/bannerBatmanCavaleiroDasTrevas.jpg',
    './assets/imgs/detalhesHistoria/capaBatmanCavaleiroDasTrevas.jpg'
),
(
    'Batman Begins',
    'A jornada de Bruce Wayne pelo mundo até forjar o símbolo que enfrentará o medo e a corrupção em Gotham.',
    2005,
    'Filme',
    'Christopher Nolan e David S. Goyer',
    'Ação / Drama',
    'Trilogia O Cavaleiro das Trevas',
    'Marcado pelo trauma do assassinato de seus pais e pela culpa de sentir medo, o jovem bilionário Bruce Wayne abandona Gotham City e viaja pelo mundo para compreender a mente criminosa. Nas montanhas da Ásia, ele é recrutado e treinado nas artes marciais e nas sombras por Henri Ducard e Ra''s al Ghul, líderes da misteriosa Liga das Sombras. Ao recusar os métodos letais da organização e retornar à sua cidade natal, Bruce transforma seu maior medo infantil em uma arma contra o crime, contando com a lealdade de Alfred Pennyworth, a tecnologia de Lucius Fox e a honestidade do sargento Jim Gordon para deter o plano do Espantalho de envenenar Gotham com gás do medo.',
    './assets/imgs/historias/bannerBatmanBegins.jpg',
    './assets/imgs/detalhesHistoria/capaBatmanBegins.jpg'
),
(
    'The Batman',
    'Em seu segundo ano como vigilante, Batman investiga uma série de assassinatos brutais cometidos pelo Charada.',
    2022,
    'Filme',
    'Matt Reeves e Peter Craig',
    'Suspense / Policial',
    'Universo The Batman',
    'Atuando há dois anos nas ruas chuvosas e opressivas de Gotham City como a personificação da vingança, um recluso Bruce Wayne mergulha nas sombras do submundo quando um serial killer sádico conhecido como Charada passa a assassinar figuras de alto escalão da elite política e policial da cidade. Deixando enigmas macabros endereçados diretamente ao Batman em cada cena do crime, o assassino expõe uma teia profunda de corrupção que liga a máfia de Carmine Falcone ao próprio passado da família Wayne. Ao lado do tenente James Gordon e da enigmática Selina Kyle, o Cavaleiro das Trevas precisa aprimorar seu lado detetive e redefinir o verdadeiro significado de seu símbolo para salvar Gotham da destruição.',
    './assets/imgs/historias/bannerTheBatman.jpg',
    './assets/imgs/detalhesHistoria/capaTheBatman.jpg');


INSERT INTO comentarioEditor(fkAdm, fkHistoria, textoComentarioEditor) VALUES
(1, 1, '"O que faz um morcego ser um morcego, é como ele desafia o impossível". O Batman Absoluto é uma história consideravelmente nova, e eu só fui dar a chance de leitura recentemente, mas assim que eu comecei a ler, foi paixão
a primeira vista. Ver um Bruce Wayne 100% novo, com sua mãe e amigos, dá um sentimento reconfortante, de ver que nessa versão, o Bruce tem por quem lutar e que essa cruzada é por quem ele ama também. Ao mesmo tempo, 
o Batman desta história é ABSURDO, e não é só por ele ter 2,06 metros e pesar 191kg, mas também pela violência e maneira que ele luta, um Bruce Wayne sem sua fortuna, ainda pode ser o Batman, tudo que ele precisa é de si mesmo e 
de um preparo absoluto, e isso me fez gostar muito dessa história. Eu recomendo essa história para qualquer pessoa que queira ver uma versão nova do Batman, desconectado de tudo que conhecemos. Ansioso pela animação que foi
anunciada.');

INSERT INTO personagem (
    nomePersonagem,
    resumoPersonagem,
    identidadeSecreta,
    categoriaPersonagem,
    primeiraAparicaoPersonagem,
    criadoresPersonagem,
    generoPersonagem,
    afiliacoesPersonagem,
    fraseMarcantePersonagem,
    biografiaPersonagem,
    bannerPersonagem,
    capaPersonagem
) VALUES
(
    'LEGO Batman',
    'A versão irreverente, egocêntrica e mestre construtora do Cavaleiro das Trevas.',
    'Bruce Wayne',
    'Herói',
    'LEGO Batman: The Videogame (2008)',
    'Traveller''s Tales / Phil Lord e Christopher Miller',
    'Masculino',
    'Bat-Família, Liga da Justiça',
    'Eu só trabalho com preto. E às vezes com cinza bem escuro.',
    'Construído peça por peça no universo de blocos, este Bruce Wayne combina as habilidades de detetive e artes marciais do Batman tradicional com um ego gigantesco, paixão por heavy metal e talentos de Mestre Construtor. Apesar de agir como um lobo solitário arrogante que recusa ajuda, sua jornada em Gotham revela que seu maior medo é perder uma nova família, levando-o a finalmente aceitar aliados como Robin, Batgirl e Alfred para salvar a cidade da Zona Fantasma.',
    './assets/imgs/personagens/imgLegoBatman.jpe',
    './assets/imgs/personagens/CapaLegoBatman.jpe'
),
(
    'Batman Que Ri',
    'Uma versão corrompida de Bruce Wayne infectada pela toxina do Coringa da Terra -22.',
    'Bruce Wayne',
    'Vilão',
    'Dark Days: The Casting #1 (2017)',
    'Scott Snyder e Greg Capullo',
    'Masculino',
    'Cavaleiros das Trevas, Legião do Mal, Perpétua',
    'Um Batman que ri é um Batman que sempre vence.',
    'Originário da Terra -22 no Multiverso das Trevas, este Bruce Wayne cedeu ao seu limite após o Coringa destruir Gotham e forçá-lo a matá-lo. Ao quebrar sua regra de ouro, Bruce inalou uma toxina letal liberada pelo coração do palhaço, reescrevendo sua mente para fundir seu intelecto estratégico perfeito com a loucura sádica de seu maior inimigo. Ele exterminou toda a Bat-Família e a Liga da Justiça de seu mundo antes de liderar uma invasão sombria ao multiverso.',
    './assets/imgs/personagens/imgBatmanQueRi.jpe',
    './assets/imgs/personagens/capaBatmanQueRi.webp'
),
(
    'Robin (Dick Grayson)',
    'O primeiro Parceiro Dinâmico e acrobata prodígio que se tornou o líder Asa Noturna.',
    'Richard John Grayson',
    'Herói',
    'Detective Comics #38 (1940)',
    'Bob Kane, Bill Finger e Jerry Robinson',
    'Masculino',
    'Bat-Família, Novos Titãs, Liga da Justiça',
    'Sempre há uma saída, mesmo no escuro.',
    'Jovem trapezista da família circense dos Graysons Voadores, Dick testemunhou o assassinato de seus pais pelo mafioso Tony Zucco. Adotado por Bruce Wayne, tornou-se o primeiro Robin, trazendo luz, humor e agilidade acrobática para equilibrar a cruzada sombria do Batman. Ao atingir a maturidade, Dick forjou sua própria identidade independente como Asa Noturna em Blüdhaven, consolidando-se como um dos maiores estrategistas e líderes morais de todo o universo DC.',
    './assets/imgs/personagens/imgRobinDick.webp',
    '/assets/imgs/personagens/imgRobinCapa.jpg'
),
(
    'Capuz Vermelho',
    'O ex-segundo Robin ressuscitado que aplica justiça letal no submundo de Gotham.',
    'Jason Peter Todd',
    'Anti-Herói',
    'Batman #357 (1983) / Batman #635 (2005)',
    'Gerry Conway, Don Newton, Judd Winick e Doug Mahnke',
    'Masculino',
    'Bat-Família, Os Foragidos',
    'Você não pode controlar o crime, Bruce. Só pode direcioná-lo.',
    'Criado nas ruas perigosas do Beco do Crime, Jason Todd foi acolhido por Bruce Wayne após tentar roubar os pneus do Batmóvel, tornando-se o segundo Robin. Impulsivo e marcado pela revolta contra a impunidade, foi brutalmente assassinado pelo Coringa. Ressuscitado anos depois através do Poço de Lázaro e treinado pela Liga dos Assassinos, retornou a Gotham como o vigilante Capuz Vermelho, usando armas de fogo e métodos letais para controlar o crime onde o código de Batman falha.',
    './assets/imgs/personagens/imgCapuz.jpg',
    './assets/imgs/personagens/capaCapuz.jpg'
),
(
    'Coringa',
    'O Palhaço Príncipe do Crime e a antítese caótica absoluta do Cavaleiro das Trevas.',
    'Desconhecida',
    'Vilão',
    'Batman #1 (1940)',
    'Bill Finger, Bob Kane e Jerry Robinson',
    'Masculino',
    'Gangue do Coringa, Liga da Injustiça',
    'Tudo o que é preciso é um dia ruim para reduzir o mais são dos homens à lunático.',
    'Desfigurado após cair em um tanque de produtos químicos na fábrica Ace Chemicals, o Coringa emergiu com pele branca, cabelos verdes e um sorriso permanente que mascara uma mente brilhante e psicótica. Sem superpoderes, ele utiliza armas temáticas mortais, seu famoso gás do riso e um imprevisível senso de humor sádico. Obcecado por provar que qualquer pessoa pode enlouquecer após um único dia ruim, ele representa o caos puro contra a ordem imposta pelo Batman.',
    './assets/imgs/personagens/imgCoringa.webp',
    './assets/imgs/personagens/capaCoringa.jpg'
),
(
    'Duas-Caras',
    'Ex-promotor público de Gotham obcecado pela dualidade, sorte e o lance de uma moeda.',
    'Harvey Dent',
    'Vilão',
    'Detective Comics #66 (1942)',
    'Bill Finger e Bob Kane',
    'Masculino',
    'Máfia de Gotham',
    'Você morre como um herói, ou vive o bastante para se tornar o vilão.',
    'Outrora o incorruptível promotor público de Gotham City e maior aliado legal do Batman e do Comissário Gordon, Harvey Dent teve metade de seu rosto desfigurado por ácido arremessado pelo mafioso Sal Maroni durante um julgamento. O trauma fraturou sua psique, despertando uma personalidade criminosa obcecada pelo número dois e pela dualidade entre o bem e o mal. Hoje, todas as suas decisões de vida ou morte são ditadas pelo cara ou coroa de sua icônica moeda de prata riscada.',
    './assets/imgs/personagens/imgDuasCaras.jpeg',
    './assets/imgs/personagens/capaDuasCaras.jpg'
);

-- =====================================================
-- QUIZZES: 1 por história e 1 por personagem
-- 5 perguntas por quiz, 5 alternativa por pergunta
-- Assume banco recém-criado (ids começando em 1).
-- =====================================================

    INSERT INTO quiz (fkHistoria, fkPersonagem) VALUES
    (1, NULL),  -- quiz 1: Batman Absoluto
    (2, NULL),  -- quiz 2: Batman Contra o Capuz Vermelho
    (3, NULL),  -- quiz 3: Batman: Arkham Knight
    (NULL, 1),  -- quiz 4: LEGO Batman
    (NULL, 2),  -- quiz 5: Batman Que Ri
    (NULL, 3),  -- quiz 6: Robin (Dick Grayson)
    (NULL, 4),  -- quiz 7: Capuz Vermelho
    (NULL, 5),  -- quiz 8: Coringa
    (NULL, 6);  -- quiz 9: Duas-Caras

    INSERT INTO pergunta (idPergunta, textoPergunta, fkQuiz) VALUES
    -- Batman Absoluto (quiz 1)
    (1, 'Qual é a profissão de Bruce Wayne em Batman Absoluto?', 1),
    (2, 'Em qual distrito de Gotham Bruce foi criado nesta versão?', 1),
    (3, 'Quem lidera a gangue dos Animais, principal ameaça da história?', 1),
    (4, 'Quem criou Batman Absoluto?', 1),
    (5, 'Quem é Alfred Pennyworth nesta versão da história?', 1),
    -- Batman Contra o Capuz Vermelho (quiz 2)
    (6, 'Quem assassinou Jason Todd, o segundo Robin?', 2),
    (7, 'Em qual cidade Jason Todd foi morto?', 2),
    (8, 'Qual regra o Capuz Vermelho impõe aos chefões do tráfico?', 2),
    (9, 'Como Jason Todd retornou à vida?', 2),
    (10, 'Qual herói investiga o Capuz Vermelho ao lado de Batman?', 2),
    -- Batman: Arkham Knight (quiz 3)
    (11, 'Qual vilão ameaça Gotham com uma nova toxina do medo?', 3),
    (12, 'Em qual noite acontece a história de Arkham Knight?', 3),
    (13, 'Quantos milhões de civis são evacuados de Gotham?', 3),
    (14, 'Quem Batman vê em alucinações causadas pelo sangue infectado?', 3),
    (15, 'Qual estúdio desenvolveu Batman: Arkham Knight?', 3),
    -- LEGO Batman (quiz 4)
    (16, 'Qual frase marcante pertence ao LEGO Batman?', 4),
    (17, 'Qual é a primeira aparição do LEGO Batman?', 4),
    (18, 'Qual é o maior medo do LEGO Batman?', 4),
    (19, 'Qual talento especial o LEGO Batman possui?', 4),
    (20, 'Qual é a paixão musical do LEGO Batman?', 4),
    -- Batman Que Ri (quiz 5)
    (21, 'De qual Terra vem o Batman Que Ri?', 5),
    (22, 'Qual toxina transformou Bruce Wayne no Batman Que Ri?', 5),
    (23, 'Quem criou o Batman Que Ri?', 5),
    (24, 'Qual regra de ouro Bruce quebrou antes de se corromper?', 5),
    (25, 'A qual grupo o Batman Que Ri está ligado?', 5),
    -- Robin (Dick Grayson) (quiz 6)
    (26, 'De qual família circense Dick Grayson faz parte?', 6),
    (27, 'Quem assassinou os pais de Dick Grayson?', 6),
    (28, 'Qual identidade Dick criou depois de deixar de ser Robin?', 6),
    (29, 'Em qual cidade Dick atua como Asa Noturna?', 6),
    (30, 'Qual é a primeira aparição de Dick Grayson?', 6),
    -- Capuz Vermelho (quiz 7)
    (31, 'Quem é a identidade secreta do Capuz Vermelho?', 7),
    (32, 'Como Jason Todd conheceu Bruce Wayne?', 7),
    (33, 'Quem matou Jason Todd quando era Robin?', 7),
    (34, 'Como Jason Todd foi ressuscitado?', 7),
    (35, 'Quem treinou Jason depois que ele voltou à vida?', 7),
    -- Coringa (quiz 8)
    (36, 'Em qual fábrica o Coringa caiu em um tanque de produtos químicos?', 8),
    (37, 'Qual é a cor do cabelo do Coringa?', 8),
    (38, 'Segundo o Coringa, o que basta para enlouquecer o mais são dos homens?', 8),
    (39, 'Qual é a primeira aparição do Coringa?', 8),
    (40, 'Qual destas é uma arma temática do Coringa?', 8),
    -- Duas-Caras (quiz 9)
    (41, 'Qual é a identidade secreta do Duas-Caras?', 9),
    (42, 'Qual era a profissão de Harvey Dent antes de virar vilão?', 9),
    (43, 'Quem arremessou o ácido no rosto de Harvey Dent?', 9),
    (44, 'Qual número obceca o Duas-Caras?', 9),
    (45, 'O que dita as decisões de vida ou morte do Duas-Caras?', 9);

    INSERT INTO alternativa (textoAlternativa, alternativaCorreta, fkPergunta) VALUES
    -- Batman Absoluto (quiz 1)
    ('Médico legista', 0, 1),
    ('Detetive da polícia', 0, 1),
    ('Engenheiro civil', 1, 1),
    ('Empresário bilionário', 0, 1),
    ('Professor de química', 0, 1),
    ('Crime Alley', 1, 2),
    ('Park Row', 0, 2),
    ('The Narrows', 0, 2),
    ('Burnley', 0, 2),
    ('Ilha de Miller', 0, 2),
    ('Pinguim', 0, 3),
    ('Duas-Caras', 0, 3),
    ('Charada', 0, 3),
    ('Máscara Negra', 1, 3),
    ('Espantalho', 0, 3),
    ('Frank Miller e David Mazzucchelli', 0, 4),
    ('Scott Snyder e Nick Dragotta', 1, 4),
    ('Bob Kane e Bill Finger', 0, 4),
    ('Jeph Loeb e Jim Lee', 0, 4),
    ('Grant Morrison e Frank Quitely', 0, 4),
    ('O mordomo da Mansão Wayne', 0, 5),
    ('Um professor do pai de Bruce', 0, 5),
    ('O líder da gangue dos Animais', 0, 5),
    ('Um médico de Crime Alley', 0, 5),
    ('Um agente de inteligência', 1, 5),
    -- Batman Contra o Capuz Vermelho (quiz 2)
    ('Duas-Caras', 0, 6),
    ('Máscara Negra', 0, 6),
    ('Coringa', 1, 6),
    ('Ra''s al Ghul', 0, 6),
    ('Espantalho', 0, 6),
    ('Sarajevo', 1, 7),
    ('Praga', 0, 7),
    ('Berlim', 0, 7),
    ('Cairo', 0, 7),
    ('Bagdá', 0, 7),
    ('Proíbe o uso de armas de fogo', 0, 8),
    ('Exige pagamento em ouro', 0, 8),
    ('Proíbe atacar a polícia', 0, 8),
    ('Proíbe vender drogas para crianças', 1, 8),
    ('Exige lealdade ao Batman', 0, 8),
    ('Por uma toxina do Espantalho', 0, 9),
    ('Através do Poço de Lázaro', 1, 9),
    ('Com o gás do riso', 0, 9),
    ('Por um experimento da Wayne Enterprises', 0, 9),
    ('Com a ajuda do Superman', 0, 9),
    ('Batgirl', 0, 10),
    ('Alfred Pennyworth', 0, 10),
    ('Comissário Gordon', 0, 10),
    ('Mulher-Gato', 0, 10),
    ('Asa Noturna', 1, 10),
    -- Batman: Arkham Knight (quiz 3)
    ('Charada', 0, 11),
    ('Pinguim', 0, 11),
    ('Espantalho', 1, 11),
    ('Hera Venenosa', 0, 11),
    ('Hush', 0, 11),
    ('Halloween', 1, 12),
    ('Natal', 0, 12),
    ('Ano-Novo', 0, 12),
    ('Páscoa', 0, 12),
    ('Dia dos Namorados', 0, 12),
    ('Um milhão', 0, 13),
    ('Três milhões', 0, 13),
    ('Dez milhões', 0, 13),
    ('Seis milhões', 1, 13),
    ('Doze milhões', 0, 13),
    ('Espantalho', 0, 14),
    ('Coringa', 1, 14),
    ('Duas-Caras', 0, 14),
    ('Charada', 0, 14),
    ('Pinguim', 0, 14),
    ('Traveller''s Tales', 0, 15),
    ('NetherRealm Studios', 0, 15),
    ('Telltale Games', 0, 15),
    ('Naughty Dog', 0, 15),
    ('Rocksteady Studios', 1, 15),
    -- LEGO Batman (quiz 4)
    ('Um Batman que ri é um Batman que sempre vence.', 0, 16),
    ('Sempre há uma saída, mesmo no escuro.', 0, 16),
    ('Eu só trabalho com preto. E às vezes com cinza bem escuro.', 1, 16),
    ('Você não pode controlar o crime, Bruce. Só pode direcioná-lo.', 0, 16),
    ('Você morre como um herói, ou vive o bastante para se tornar o vilão.', 0, 16),
    ('LEGO Batman: The Videogame (2008)', 1, 17),
    ('Detective Comics #27 (1939)', 0, 17),
    ('Batman #1 (1940)', 0, 17),
    ('Dark Days: The Casting #1 (2017)', 0, 17),
    ('Batman: Arkham Knight (2015)', 0, 17),
    ('Ficar sem o Batmóvel', 0, 18),
    ('Ser esquecido pela cidade', 0, 18),
    ('Enfrentar o Coringa', 0, 18),
    ('Perder uma nova família', 1, 18),
    ('Perder a máscara', 0, 18),
    ('Mestre dos Disfarces', 0, 19),
    ('Mestre Construtor', 1, 19),
    ('Mestre Ilusionista', 0, 19),
    ('Mestre das Sombras', 0, 19),
    ('Mestre Inventor', 0, 19),
    ('Ópera', 0, 20),
    ('Jazz', 0, 20),
    ('Música country', 0, 20),
    ('Música eletrônica', 0, 20),
    ('Heavy metal', 1, 20),
    -- Batman Que Ri (quiz 5)
    ('Terra-1', 0, 21),
    ('Terra-2', 0, 21),
    ('Terra -22', 1, 21),
    ('Terra 0', 0, 21),
    ('Terra -52', 0, 21),
    ('A toxina do Coringa', 1, 22),
    ('O gás do medo do Espantalho', 0, 22),
    ('A Hera do Poço de Lázaro', 0, 22),
    ('O veneno do Bane', 0, 22),
    ('O ácido do Duas-Caras', 0, 22),
    ('Bob Kane e Bill Finger', 0, 23),
    ('Gerry Conway e Don Newton', 0, 23),
    ('Judd Winick e Doug Mahnke', 0, 23),
    ('Scott Snyder e Greg Capullo', 1, 23),
    ('Bill Finger e Jerry Robinson', 0, 23),
    ('Nunca usar armas de fogo', 0, 24),
    ('Nunca matar', 1, 24),
    ('Nunca revelar sua identidade', 0, 24),
    ('Nunca trabalhar sozinho', 0, 24),
    ('Nunca sair de Gotham', 0, 24),
    ('Liga da Justiça', 0, 25),
    ('Novos Titãs', 0, 25),
    ('Os Foragidos', 0, 25),
    ('Máfia de Gotham', 0, 25),
    ('Legião do Mal', 1, 25),
    -- Robin (Dick Grayson) (quiz 6)
    ('Irmãos Maravilha', 0, 26),
    ('Trapezistas de Gotham', 0, 26),
    ('Graysons Voadores', 1, 26),
    ('Família Zucco', 0, 26),
    ('Circo Haly', 0, 26),
    ('Tony Zucco', 1, 27),
    ('Sal Maroni', 0, 27),
    ('Máscara Negra', 0, 27),
    ('Coringa', 0, 27),
    ('Pinguim', 0, 27),
    ('Capuz Vermelho', 0, 28),
    ('Batgirl', 0, 28),
    ('Cavaleiro de Arkham', 0, 28),
    ('Asa Noturna', 1, 28),
    ('Duas-Caras', 0, 28),
    ('Metrópolis', 0, 29),
    ('Blüdhaven', 1, 29),
    ('Central City', 0, 29),
    ('Star City', 0, 29),
    ('Sarajevo', 0, 29),
    ('Batman #1 (1940)', 0, 30),
    ('Batman #357 (1983)', 0, 30),
    ('Detective Comics #66 (1942)', 0, 30),
    ('Batman #635 (2005)', 0, 30),
    ('Detective Comics #38 (1940)', 1, 30),
    -- Capuz Vermelho (quiz 7)
    ('Richard John Grayson', 0, 31),
    ('Harvey Dent', 0, 31),
    ('Jason Peter Todd', 1, 31),
    ('Bruce Wayne', 0, 31),
    ('Tim Drake', 0, 31),
    ('Tentando roubar os pneus do Batmóvel', 1, 32),
    ('Foi resgatado de um incêndio', 0, 32),
    ('Estudava na escola de Bruce', 0, 32),
    ('Foi preso por Batman', 0, 32),
    ('Trabalhava na Mansão Wayne', 0, 32),
    ('Duas-Caras', 0, 33),
    ('Ra''s al Ghul', 0, 33),
    ('Espantalho', 0, 33),
    ('Coringa', 1, 33),
    ('Máscara Negra', 0, 33),
    ('Gás do riso', 0, 34),
    ('Poço de Lázaro', 1, 34),
    ('Toxina do medo', 0, 34),
    ('Experimento da Wayne Enterprises', 0, 34),
    ('Máquina de Gotham', 0, 34),
    ('Liga da Justiça', 0, 35),
    ('Novos Titãs', 0, 35),
    ('Máfia de Gotham', 0, 35),
    ('Gangue do Coringa', 0, 35),
    ('Liga dos Assassinos', 1, 35),
    -- Coringa (quiz 8)
    ('Wayne Enterprises', 0, 36),
    ('Arkham Industries', 0, 36),
    ('Ace Chemicals', 1, 36),
    ('Gotham Chemicals', 0, 36),
    ('Stagg Enterprises', 0, 36),
    ('Verde', 1, 37),
    ('Vermelho', 0, 37),
    ('Preto', 0, 37),
    ('Azul', 0, 37),
    ('Roxo', 0, 37),
    ('Uma noite sem dormir', 0, 38),
    ('Uma grande perda', 0, 38),
    ('Um tanque de ácido', 0, 38),
    ('Um dia ruim', 1, 38),
    ('Uma queda de cavalo', 0, 38),
    ('Detective Comics #38 (1940)', 0, 39),
    ('Batman #1 (1940)', 1, 39),
    ('Detective Comics #66 (1942)', 0, 39),
    ('Batman #357 (1983)', 0, 39),
    ('Dark Days: The Casting #1 (2017)', 0, 39),
    ('Moeda de prata', 0, 40),
    ('Toxina do medo', 0, 40),
    ('Batarangue', 0, 40),
    ('Gás lacrimogêneo', 0, 40),
    ('Gás do riso', 1, 40),
    -- Duas-Caras (quiz 9)
    ('Jason Todd', 0, 41),
    ('Sal Maroni', 0, 41),
    ('Harvey Dent', 1, 41),
    ('Oswald Cobblepot', 0, 41),
    ('Edward Nygma', 0, 41),
    ('Promotor público', 1, 42),
    ('Policial', 0, 42),
    ('Juiz', 0, 42),
    ('Médico', 0, 42),
    ('Jornalista', 0, 42),
    ('Coringa', 0, 43),
    ('Máscara Negra', 0, 43),
    ('Pinguim', 0, 43),
    ('Sal Maroni', 1, 43),
    ('Ra''s al Ghul', 0, 43),
    ('Três', 0, 44),
    ('Dois', 1, 44),
    ('Sete', 0, 44),
    ('Treze', 0, 44),
    ('Um', 0, 44),
    ('Um baralho marcado', 0, 45),
    ('Um par de dados', 0, 45),
    ('Uma roleta', 0, 45),
    ('Um relógio quebrado', 0, 45),
    ('Uma moeda de prata riscada', 1, 45);

-- =====================================================
-- 1. INSERÇÃO DOS QUIZZES (vinculados às 7 histórias)
-- (Continuando a partir do idQuiz = 10, após os 9 já cadastrados)
-- =====================================================
INSERT INTO quiz (fkHistoria, fkPersonagem) VALUES
(4, NULL),  -- quiz 10: Batman: Arkham Asylum
(5, NULL),  -- quiz 11: Batman: Arkham City
(6, NULL),  -- quiz 12: Batman: Arkham Origins
(7, NULL),  -- quiz 13: Batman: Asilo Arkham (HQ)
(8, NULL),  -- quiz 14: Batman: O Cavaleiro das Trevas (HQ)
(9, NULL),  -- quiz 15: Batman Begins
(10, NULL); -- quiz 16: The Batman

-- =====================================================
-- 2. INSERÇÃO DAS PERGUNTAS (continuando do idPergunta = 46 até 80)
-- =====================================================
INSERT INTO pergunta (idPergunta, textoPergunta, fkQuiz) VALUES
-- Batman: Arkham Asylum (quiz 10)
(46, 'Qual é o nome da fórmula experimental usada pelo Coringa para criar monstros?', 10),
(47, 'Quem ajuda o Coringa internamente a assumir o controle do Asilo Arkham?', 10),
(48, 'Qual vilão usa gás do medo para provocar alucinações no Batman durante o jogo?', 10),
(49, 'Qual prisão de Gotham teve seus detentos transferidos para o Asilo Arkham?', 10),
(50, 'Qual vilão gigante habita os esgotos subterrâneos do Asilo Arkham?', 10),
-- Batman: Arkham City (quiz 11)
(51, 'Quem é o diretor responsável pela megaprisão Arkham City e pelo Protocolo 10?', 11),
(52, 'Por que Batman corre contra o tempo para encontrar uma cura em Arkham City?', 11),
(53, 'Qual organização militar privada vigia os muros de Arkham City?', 11),
(54, 'Qual prefeito de Gotham autorizou a criação da megaprisão Arkham City?', 11),
(55, 'Quem ajuda Batman a sintetizar a cura usando o sangue de Ra''s al Ghul?', 11),
-- Batman: Arkham Origins (quiz 12)
(56, 'Qual vilão oferece 50 milhões de dólares pela cabeça do Batman no Natal?', 12),
(57, 'Quantos assassinos profissionais são contratados para eliminar o Batman?', 12),
(58, 'Qual assassino enfrenta o Batman em um duelo no navio do Pinguim?', 12),
(59, 'Em qual data comemorativa se passa a história de Batman: Arkham Origins?', 12),
(60, 'Quem estava disfarçado como o Máscara Negra durante o ataque à prisão Blackgate?', 12),
-- Batman: Asilo Arkham - Quadrinho (quiz 13)
(61, 'Quem escreveu e ilustrou a graphic novel Batman: Asilo Arkham (1989)?', 13),
(62, 'Quem foi o fundador original da mansão que se tornou o Asilo Arkham?', 13),
(63, 'Qual é a condição exigida pelos internos para libertar os reféns do asilo?', 13),
(64, 'Qual objeto substitui a moeda de Duas-Caras em seu tratamento psiquiátrico?', 13),
(65, 'Em que ano foi publicada originalmente a HQ Batman: Asilo Arkham?', 13),
-- Batman: O Cavaleiro das Trevas - Quadrinho (quiz 14)
(66, 'Com qual idade Bruce Wayne retorna da aposentadoria em O Cavaleiro das Trevas?', 14),
(67, 'Qual é o nome da gangue violenta que aterroriza Gotham no início da história?', 14),
(68, 'Quem assume o manto de Robin ao lado do Batman idoso nessa HQ?', 14),
(69, 'Qual herói enfrenta o Batman em um duelo épico no desfecho da história?', 14),
(70, 'Quantos anos Bruce Wayne ficou aposentado antes de voltar a ser o Batman?', 14),
-- Batman Begins - Filme (quiz 15)
(71, 'Qual organização treina Bruce Wayne nas montanhas da Ásia?', 15),
(72, 'Quem fornece os protótipos tecnológicos e o Tumbler (Batmóvel) para Bruce?', 15),
(73, 'Qual substância o Espantalho utiliza para espalhar o pânico em Gotham?', 15),
(74, 'Quem é o verdadeiro líder da Liga das Sombras revelado em Gotham?', 15),
(75, 'Qual aparelho das Empresas Wayne é roubado para vaporizar o suprimento de água?', 15),
-- The Batman - Filme (quiz 16)
(76, 'Há quantos anos Bruce Wayne atua como vigilante em The Batman (2022)?', 16),
(77, 'Qual vilão deixa enigmas endereçados ao Batman nas cenas dos crimes?', 16),
(78, 'Qual mafioso controla grande parte da corrupção política e policial de Gotham?', 16),
(79, 'Qual equipamento o Charada usa para inundar Gotham City no ato final?', 16),
(80, 'Qual cargo policial James Gordon ocupa no filme The Batman (2022)?', 16);

-- =====================================================
-- 3. INSERÇÃO DAS ALTERNATIVAS (tabela alternativa, 3 colunas)
-- =====================================================
INSERT INTO alternativa (textoAlternativa, alternativaCorreta, fkPergunta) VALUES
-- Batman: Arkham Asylum (quiz 10)
('Soro Veneno', 0, 46),
('Gás do Riso', 0, 46),
('Fórmula Titã', 1, 46),
('Poço de Lázaro', 0, 46),
('Toxina do Medo', 0, 46),
('Arlequina', 1, 47),
('Hera Venenosa', 0, 47),
('Mulher-Gato', 0, 47),
('Talia al Ghul', 0, 47),
('Doutora Penelope Young', 0, 47),
('Chapeleiro Louco', 0, 48),
('Charada', 0, 48),
('Senhor Frio', 0, 48),
('Espantalho', 1, 48),
('Victor Zsasz', 0, 48),
('Penitenciária Iron Heights', 0, 49),
('Prisão Blackgate', 1, 49),
('Belle Reve', 0, 49),
('Fortaleza da Solidão', 0, 49),
('Penitenciária Stryker', 0, 49),
('Cara-de-Barro', 0, 50),
('Solomon Grundy', 0, 50),
('Morcego Humano', 0, 50),
('Bane', 0, 50),
('Crocodilo (Killer Croc)', 1, 50),
-- Batman: Arkham City (quiz 11)
('Quincy Sharp', 0, 51),
('Ra''s al Ghul', 0, 51),
('Hugo Strange', 1, 51),
('Silêncio', 0, 51),
('Jeremiah Arkham', 0, 51),
('Foi infectado pelo sangue envenenado do Coringa', 1, 52),
('Foi picado por uma planta da Hera Venenosa', 0, 52),
('Inalou toxina do medo em excesso', 0, 52),
('Foi congelado pelo Senhor Frio', 0, 52),
('Sofreu radiação de um satélite da TYGER', 0, 52),
('Liga das Sombras', 0, 53),
('A.R.G.U.S.', 0, 53),
('Esquadrão Suicida', 0, 53),
('TYGER', 1, 53),
('Xeque-Mate', 0, 53),
('Hamilton Hill', 0, 54),
('Quincy Sharp', 1, 54),
('Oswald Cobblepot', 0, 54),
('Rupert Thorne', 0, 54),
('Armand Krol', 0, 54),
('Lucius Fox', 0, 55),
('Alfred Pennyworth', 0, 55),
('Oráculo', 0, 55),
('Talia al Ghul', 0, 55),
('Senhor Frio (Victor Fries)', 1, 55),
-- Batman: Arkham Origins (quiz 12)
('Pinguim', 0, 56),
('Carmine Falcone', 0, 56),
('Máscara Negra', 1, 56),
('Duas-Caras', 0, 56),
('Sal Maroni', 0, 56),
('Oito assassinos', 1, 57),
('Cinco assassinos', 0, 57),
('Dez assassinos', 0, 57),
('Doze assassinos', 0, 57),
('Seis assassinos', 0, 57),
('Pistoleiro', 0, 58),
('Vagalume', 0, 58),
('Bane', 0, 58),
('Exterminador (Deathstroke)', 1, 58),
('Lady Shiva', 0, 58),
('Noite de Halloween', 0, 59),
('Véspera de Natal', 1, 59),
('Véspera de Ano Novo', 0, 59),
('Dia de Ação de Graças', 0, 59),
('Sexta-feira 13', 0, 59),
('Charada', 0, 60),
('Chapeleiro Louco', 0, 60),
('Anarquia', 0, 60),
('Exterminador', 0, 60),
('Coringa', 1, 60),
-- Batman: Asilo Arkham - Quadrinho (quiz 13)
('Alan Moore e Brian Bolland', 0, 61),
('Frank Miller e David Mazzucchelli', 0, 61),
('Grant Morrison e Dave McKean', 1, 61),
('Jeph Loeb e Tim Sale', 0, 61),
('Scott Snyder e Greg Capullo', 0, 61),
('Amadeus Arkham', 1, 62),
('Jeremiah Arkham', 0, 62),
('Thomas Wayne', 0, 62),
('Cyrus Gold', 0, 62),
('Hugo Strange', 0, 62),
('Que o Comissário Gordon renuncie ao cargo', 0, 63),
('Que a Prefeitura pague um resgate bilionário', 0, 63),
('Que todos os presos sejam soltos nas ruas', 0, 63),
('Que o Batman entre no asilo e passe uma noite lá', 1, 63),
('Que o Coringa seja levado ao prédio da Prefeitura', 0, 63),
('Um dado de seis lados', 0, 64),
('Um baralho de tarô', 1, 64),
('Uma roleta de bolso', 0, 64),
('Um relógio de ouro', 0, 64),
('Um tabuleiro de xadrez', 0, 64),
('1986', 0, 65),
('1994', 0, 65),
('1979', 0, 65),
('1991', 0, 65),
('1989', 1, 65),
-- Batman: O Cavaleiro das Trevas - Quadrinho (quiz 14)
('45 anos', 0, 66),
('65 anos', 0, 66),
('55 anos', 1, 66),
('50 anos', 0, 66),
('60 anos', 0, 66),
('Os Mutantes', 1, 67),
('Os Animais', 0, 67),
('Corte das Corujas', 0, 67),
('Gangue do País das Maravilhas', 0, 67),
('Filhos de Arkham', 0, 67),
('Stephanie Brown', 0, 68),
('Tim Drake', 0, 68),
('Cassandra Cain', 0, 68),
('Carrie Kelley', 1, 68),
('Barbara Gordon', 0, 68),
('Lanterna Verde', 0, 69),
('Superman', 1, 69),
('Flash', 0, 69),
('Arqueiro Verde', 0, 69),
('Mulher-Maravilha', 0, 69),
('Cinco anos', 0, 70),
('Quinze anos', 0, 70),
('Vinte anos', 0, 70),
('Oito anos', 0, 70),
('Dez anos', 1, 70),
-- Batman Begins - Filme (quiz 15)
('Ordem de São Dumas', 0, 71),
('Corte das Corujas', 0, 71),
('Liga das Sombras', 1, 71),
('Leviatã', 0, 71),
('Irmandade do Punho', 0, 71),
('Lucius Fox', 1, 72),
('Harold Allnut', 0, 72),
('William Earle', 0, 72),
('Harvey Dent', 0, 72),
('Alfred Pennyworth', 0, 72),
('Toxina Titã', 0, 73),
('Veneno do Coringa', 0, 73),
('Esporos de Hera Venenosa', 0, 73),
('Gás do medo', 1, 73),
('Soro da Verdade', 0, 73),
('Carmine Falcone', 0, 74),
('Henri Ducard (Ra''s al Ghul)', 1, 74),
('Jonathan Crane', 0, 74),
('Sal Maroni', 0, 74),
('Victor Zsasz', 0, 74),
('Gerador de pulso eletromagnético', 0, 75),
('Reator de fusão limpa', 0, 75),
('Satélite de rastreamento sonar', 0, 75),
('Canhão sônico portátil', 0, 75),
('Emissor de micro-ondas', 1, 75),
-- The Batman - Filme (quiz 16)
('Um ano', 0, 76),
('Cinco anos', 0, 76),
('Dois anos', 1, 76),
('Dez anos', 0, 76),
('Seis meses', 0, 76),
('Charada', 1, 77),
('Coringa', 0, 77),
('Silêncio', 0, 77),
('Chapeleiro Louco', 0, 77),
('Homem-Calendário', 0, 77),
('Sal Maroni', 0, 78),
('Rupert Thorne', 0, 78),
('Tony Zucco', 0, 78),
('Carmine Falcone', 1, 78),
('Oswald Cobblepot', 0, 78),
('Bombas na torre da Prefeitura', 0, 79),
('Explosivos nos paredões de contenção da baía', 1, 79),
('Caminhões-tanque na ponte principal', 0, 79),
('Drones armados no estádio Gotham Square', 0, 79),
('Comportas da usina hidrelétrica de Arkham', 0, 79),
('Comissário', 0, 80),
('Capitão', 0, 80),
('Detetive novato', 0, 80),
('Chefe de polícia', 0, 80),
('Tenente', 1, 80);