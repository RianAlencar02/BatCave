DROP DATABASE IF EXISTS BatCave;
CREATE DATABASE BatCave;
USE BatCave;


CREATE TABLE usuario (
    idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nomeUsuario VARCHAR(45),
    emailUsuario VARCHAR(45),
    senhaUsuario VARCHAR(20),
    dataCriacao DATETIME DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE adm (
    idAdm INT PRIMARY KEY AUTO_INCREMENT,
    nomeAdm VARCHAR(45),
    emailAdm VARCHAR(50),
    senhaAdm VARCHAR(20)
);

CREATE TABLE historia (
    idHistoria INT PRIMARY KEY AUTO_INCREMENT,
    tituloHistoria VARCHAR(100),
    resumoHistoria VARCHAR(100),
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
    idHistoriasFavoritadas INT,
    fkUsuario INT,
    fkHistoria INT,
    PRIMARY KEY (idHistoriasFavoritadas, fkUsuario, fkHistoria),
    CONSTRAINT fk_historiasFavoritadas_usuario FOREIGN KEY (fkUsuario) REFERENCES usuario(idUsuario),
    CONSTRAINT fk_historiasFavoritadas_historia FOREIGN KEY (fkHistoria) REFERENCES historia(idHistoria)
);


CREATE TABLE avaliacaoHistoria (
    idAvaliacaoHistoria INT,
    fkUsuario INT,
    fkHistoria INT,
    notaAvaliacao INT,
    PRIMARY KEY (idAvaliacaoHistoria,fkUsuario, fkHistoria),
    CONSTRAINT fk_avaliacaoHistoria_usuario FOREIGN KEY (fkUsuario) REFERENCES usuario(idUsuario),
    CONSTRAINT fk_avaliacaoHistoria_historia FOREIGN KEY (fkHistoria) REFERENCES historia(idHistoria)
);




CREATE TABLE personagensFavoritados (
    idPersonagensFavoritados INT,
    fkUsuario INT,
    fkPersonagem INT,
    PRIMARY KEY (idPersonagensFavoritados, fkUsuario, fkPersonagem),
    CONSTRAINT fk_personagensFavoritados_usuario FOREIGN KEY (fkUsuario) REFERENCES usuario(idUsuario),
    CONSTRAINT fk_personagensFavoritados_personagem FOREIGN KEY (fkPersonagem) REFERENCES personagem(idPersonagem)
);

CREATE TABLE comentarioEditor (
    idComentarioEditor INT PRIMARY KEY AUTO_INCREMENT,
    textoComentarioEditor VARCHAR(500),
    fkAdm INT,
    fkPersonagem INT,
    fkHistoria INT,
    CONSTRAINT fk_comentarioEditor_adm FOREIGN KEY (fkAdm) REFERENCES adm(idAdm),
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
    idPergunta INT AUTO_INCREMENT,
    textoPergunta VARCHAR(100),
    fkQuiz INT,
    PRIMARY KEY (idPergunta, fkQuiz),
    CONSTRAINT fk_pergunta_quiz FOREIGN KEY (fkQuiz) REFERENCES quiz(idQuiz)
);

CREATE TABLE alternativas (
    idAlternativas INT PRIMARY KEY AUTO_INCREMENT,
    textoAlternativa VARCHAR(100),
    alternativaCorreta TINYINT,
    fkPergunta INT,
    fkQuizPergunta INT,
    CONSTRAINT fk_alternativas_pergunta FOREIGN KEY (fkPergunta) REFERENCES pergunta(idPergunta),
    CONSTRAINT fk_alternativas_quiz FOREIGN KEY (fkQuizPergunta) REFERENCES quiz(idQuiz)
);

CREATE TABLE tentativa (
    idTentativa INT PRIMARY KEY AUTO_INCREMENT,
    pontuacao INT,
    fkUsuario INT,
    fkQuiz INT,
    CONSTRAINT fk_tentativa_usuario FOREIGN KEY (fkUsuario) REFERENCES usuario(idUsuario),
    CONSTRAINT fk_tentativa_quiz FOREIGN KEY (fkQuiz) REFERENCES quiz(idQuiz)
);

CREATE TABLE alternativaEscolhida (
    fkTentativa INT,
    fkAlternativas INT,
    fkPergunta INT,
    fkQuizPergunta INT,
    PRIMARY KEY (fkTentativa, fkAlternativas, fkPergunta, fkQuizPergunta),
    CONSTRAINT fk_alternativaEscolhida_tentativa FOREIGN KEY (fkTentativa) REFERENCES tentativa(idTentativa),
    CONSTRAINT fk_alternativaEscolhida_alternativas FOREIGN KEY (fkAlternativas) REFERENCES alternativas(idAlternativas),
    CONSTRAINT fk_alternativaEscolhida_pergunta FOREIGN KEY (fkPergunta) REFERENCES pergunta(idPergunta),
    CONSTRAINT fk_alternativaEscolhida_quiz FOREIGN KEY (fkQuizPergunta) REFERENCES quiz(idQuiz)
);

INSERT INTO adm (nomeAdm, emailAdm, senhaAdm) VALUES
('Rian', 'rian@adm.com', 'rian123');

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
);


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
    ''
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
    ''
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
    ''
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
    ''
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
    ''
);
