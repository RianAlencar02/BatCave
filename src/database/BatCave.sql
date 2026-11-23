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




-- SELECT de infos do usuario para o perfil
SELECT u.* FROM usuario AS u WHERE u.idUsuario = 1;

-- SELECT de historias de um usuario especifico para o perfil.
SELECT h.tituloHistoria, h.bannerHistoria FROM usuario AS u 
LEFT JOIN historiasFavoritadas AS hf ON hf.fkUsuario = u.idUsuario LEFT JOIN historia AS h ON h.idHistoria = hf.fkHistoria 
WHERE idUsuario = 1;


-- SELECT de personagens favoritados de um usuario especifico para o perfil.
SELECT p.nomePersonagem, p.bannerPersonagem  FROM usuario AS u 
JOIN personagensFavoritados AS pf ON pf.fkusuario = u.idUsuario JOIN personagem AS p ON p.idPersonagem = pf.fkPersonagem
WHERE idUsuario = 1;


-- SELECT para a listagem de quizes respondidos de historia no perfil
SELECT h.tituloHistoria, h.bannerHistoria, t.idTentativa, SUM(a.alternativaCorreta) AS questoesAcertadas, 
SUM(a.alternativaCorreta) / 5 * 100 AS 'porcentagemAcerto'
FROM tentativa AS t 
JOIN quiz AS q on t.fkQuiz = q.idQuiz
JOIN historia AS h ON q.fkHistoria = h.idHistoria
JOIN alternativaEscolhida AS ae ON ae.fkTentativa = t.idTentativa
JOIN alternativa AS a ON ae.fkAlternativa = a.idAlternativa
WHERE t.fkUsuario = 1 
GROUP BY t.idTentativa, q.idQuiz, h.idHistoria, h.tituloHistoria, h.bannerHistoria
HAVING COUNT(*) = 5; -- Serve para filtrar e só trazer os quizes respondidos, pois após o agrupamento pelo idTentativa, ele só trara as tentativas com 5 registros (ou seja, quizes que foram concluidos).

-- SELECT para a listagem de quizes respondidos de personagem no perfil
SELECT p.nomePersonagem, p.bannerPersonagem, t.idTentativa, SUM(a.alternativaCorreta) AS questoesAcertadas, 
SUM(a.alternativaCorreta) / 5 * 100 AS 'porcentagemAcerto'
FROM tentativa AS t 
JOIN quiz AS q on t.fkQuiz = q.idQuiz
JOIN personagem AS p ON q.fkPersonagem = p.idPersonagem
JOIN alternativaEscolhida AS ae ON ae.fkTentativa = t.idTentativa
JOIN alternativa AS a ON ae.fkAlternativa = a.idAlternativa
WHERE t.fkUsuario = 1 
GROUP BY t.idTentativa, q.idQuiz, p.idPersonagem, p.nomePersonagem, p.bannerPersonagem
HAVING COUNT(*) = 5;

-- SELECT de historias avaliadas para o perfil
SELECT  h.tituloHistoria, h.bannerHistoria, ah.notaAvaliacao, ah.dataAvaliacao FROM historia AS h
JOIN avaliacaoHistoria AS ah ON ah.fkHistoria = h.idHistoria
WHERE ah.fkUsuario = 1;


SELECT a.fkPergunta, a.idAlternativa, a.textoAlternativa, a.alternativaCorreta FROM alternativa AS a
    INNER JOIN pergunta AS p ON p.idPergunta = a.fkPergunta
    INNER JOIN quiz AS q ON q.idQuiz = p.fkQuiz
    WHERE q.fkHistoria = 1
    ORDER BY a.fkPergunta ASC;
    
SELECT p.idPergunta, p.textoPergunta FROM pergunta AS p JOIN quiz AS q ON q.idQuiz = p.fkQuiz
    WHERE q.fkHistoria = 1 ORDER BY p.idPergunta;
    
