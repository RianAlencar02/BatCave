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
    sinopseHistoria VARCHAR(500),
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

-- INSERT : Historia
INSERT INTO historia (tituloHistoria, resumoHistoria, anoHistoria, tipoHistoria, criadorHistoria, generoHistoria, universoHistoria, sinopseHistoria, bannerHistoria, capaHistoria) VALUES
(
    'Batman Absoluto',
    'Um Bruce Wayne da classe trabalhadora enfrenta uma Gotham brutal sem sua fortuna.',
    2024,
    'Quadrinho',
    'Scott Snyder e Nick Dragotta',
    'Ação / Suspense',
    'Universo Absoluto',
    'Sem a mansão, sem o dinheiro e sem o mordomo, esta versão reimaginada apresenta um Bruce Wayne engenheiro civil que usa pura brutalidade, engenhosidade e um traje tático improvisado para combater a violenta gangue dos Animais e a corrupção sistêmica de Gotham.',
	'./assets/imgs/historias/bannerBatmanAbs.jpeg',
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
    'Cinco anos após a trágica morte de Jason Todd nas mãos do Coringa, um misterioso e implacável vigilante conhecido como Capuz Vermelho assume o controle do submundo de Gotham. Ao tentar detê-lo, Batman descobre uma verdade devastadora que coloca seu código moral à prova.',
    './assets/imgs/historias/bannerBatmanCapuzVermelho.avif',
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
    'Um ano após a morte do Coringa, o Espantalho ameaça detonar uma toxina do medo letal em Gotham, forçando a evacuação da cidade. Com a ajuda de um exército militar liderado pelo misterioso Cavaleiro de Arkham, os vilões unem forças para acabar definitivamente com o Batman.',
	'./assets/imgs/historias/bannerBatmanArkham.jpg',
    './assets/imgs/detalhesHistoria/bannerBatmanArkham.jpg'
);