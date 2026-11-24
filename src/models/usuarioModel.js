var database = require("../database/config");

function cadastrar(nomeUsuario, emailUsuario, senhaUsuario) {
  // Preparando a query para criar um usuário.
  let querySQL = `INSERT INTO usuario (nomeUsuario, emailUsuario, senhaUsuario) VALUES ('${nomeUsuario}', '${emailUsuario}', '${senhaUsuario}');`;
  console.log("Executando a query de inserção: \n" + querySQL);
  return database.executar(querySQL);
}

function logar(emailUsuario, senhaUsuario) {
  // Preparando a query para logar.
  let querySQL = `SELECT idUsuario, nomeUsuario, emailUsuario FROM usuario WHERE emailUsuario = '${emailUsuario}' AND senhaUsuario = '${senhaUsuario}'`;
  console.log("Executando a query de login (SELECT): \n" + querySQL);
  return database.executar(querySQL);
}

function favoritar(idUsuario, tipo, idFavoritado) {
  if (tipo == "personagem") {
    let querySQL = `INSERT INTO personagensFavoritados (fkUsuario, fkPersonagem) VALUES (${idUsuario}, ${idFavoritado})`;
    console.log("Executando a query de favoritar um personagem: \n" + querySQL);
    return database.executar(querySQL);
  } else {
    let querySQL = `INSERT INTO historiasFavoritadas (fkUsuario, fkHistoria) VALUES (${idUsuario}, ${idFavoritado})`;
    console.log(
      tipo + "Executando a query de favoritar uma história: \n" + querySQL,
    );
    return database.executar(querySQL);
  }
}

function removerFavorito(idUsuario, tipo, idFavoritado) {
  if (tipo == "personagem") {
    let querySQL = `DELETE FROM personagensFavoritados WHERE fkUsuario = ${idUsuario} AND fkPersonagem = ${idFavoritado};`;
    console.log(
      "Executando a query de remover um personagem favoritado: \n" + querySQL,
    );
    return database.executar(querySQL);
  } else {
    let querySQL = `DELETE FROM historiasFavoritadas WHERE fkUsuario = ${idUsuario} AND fkHistoria = ${idFavoritado};`;
    console.log(
      tipo + "Executando a query de favoritar uma história: \n" + querySQL,
    );
    return database.executar(querySQL);
  }
}

function verificarFavoritado(idUsuario, tipo, idFavoritado) {
  if (tipo == "personagem") {
    let querySQL = `SELECT 1 FROM personagensFavoritados WHERE fkUsuario = ${idUsuario} AND fkPersonagem = ${idFavoritado}`;
    return database.executar(querySQL);
  } else {
    let querySQL = `SELECT 1 FROM historiasFavoritadas WHERE fkUsuario = ${idUsuario} AND fkHistoria = ${idFavoritado}`;
    return database.executar(querySQL);
  }
}

function avaliar(notaAvaliacao, idUsuario, idHistoria) {
  let querySQL = `INSERT INTO avaliacaoHistoria (notaAvaliacao, fkUsuario, fkHistoria) VALUES (${notaAvaliacao},${idUsuario}, ${idHistoria})`;
  console.log("Executando query de avaliar uma história.");
  return database.executar(querySQL);
}

function avaliar(notaAvaliacao, idUsuario, idHistoria) {
  let querySQL = `INSERT INTO avaliacaoHistoria (notaAvaliacao, fkUsuario, fkHistoria) VALUES (${notaAvaliacao},${idUsuario}, ${idHistoria})`;
  console.log("Executando query de avaliar uma história.");
  return database.executar(querySQL);
}

function alterarAvaliacao(notaAvaliacao, idUsuario, idHistoria) {
  let querySQL = `UPDATE avaliacaoHistoria SET notaAvaliacao = ${notaAvaliacao} WHERE fkUsuario = ${idUsuario} AND fkHistoria = ${idHistoria}`;
  console.log("Executando query de alterar uma avaliação.");
  return database.executar(querySQL);
}

function verificarAvaliacao(idUsuario, idHistoria) {
  let querySQL = `SELECT 1 FROM avaliacaoHistoria WHERE fkUsuario = ${idUsuario} AND fkHistoria = ${idHistoria}`;
  console.log("Verificando se já avaliou.");
  return database.executar(querySQL);
}

function puxarInformacoesUsuario(idUsuario) {
  let querySQL = `SELECT u.nomeUsuario, u.emailUsuario, DATE_FORMAT(u.dataCriacao, '%d/%m/%Y %H:%i:%s') AS dataHoraCriacao,
    ((SELECT COUNT(*) FROM personagensFavoritados WHERE fkUsuario = u.idUsuario) +
    (SELECT COUNT(*) FROM historiasFavoritadas WHERE fkUsuario = u.idUsuario)
    ) AS qntFavoritos,
    (SELECT COUNT(*) FROM avaliacaoHistoria WHERE fkUsuario = u.idUsuario) AS qntHistoriasAvaliadas,
    (SELECT COUNT(*) FROM tentativa WHERE fkUsuario = u.idUsuario) AS qntQuizesConcluidos
FROM usuario u
WHERE u.idUsuario = ${idUsuario};`;
  console.log("Executando a query de pegar todas as informações: \n" + querySQL);
  return database.executar(querySQL);
}

function inserirTentativa(pontuacao, idUsuario, idQuiz) {
  let querySQL = `INSERT INTO tentativa (pontuacao, fkUsuario, fkQuiz) VALUES (${pontuacao}, ${idUsuario}, ${idQuiz})`;
  console.log("Executando a query para registrar uma tentativa após o termino do quiz: \n" + querySQL);
  return database.executar(querySQL);
}

function inserirAlternativaEscolhida(idTentativa, idAlternativa) {
  let querySQL = `INSERT INTO alternativaEscolhida (fkTentativa, fkAlternativa) VALUES (${idTentativa}, ${idAlternativa})`;
  console.log("Registrando alternativa escolhida: \n" + querySQL);
  return database.executar(querySQL);
}

function puxarHistoriasFavoritadas(idUsuario) {
  let querySQL = `SELECT h.idHistoria, h.tituloHistoria, h.bannerHistoria FROM usuario AS u
  JOIN historiasFavoritadas AS hf ON hf.fkUsuario = u.idUsuario 
  JOIN historia AS h ON h.idHistoria = hf.fkHistoria  WHERE idUsuario = ${idUsuario}`;
  console.log("Trazendo todos as histórias favoritadas: \n" + querySQL);
  return database.executar(querySQL);
}

function puxarPersonagensFavoritados(idUsuario) {
  let querySQL = `SELECT p.idPersonagem, p.nomePersonagem, p.bannerPersonagem  FROM usuario AS u 
  JOIN personagensFavoritados AS pf ON pf.fkusuario = u.idUsuario JOIN personagem AS p ON p.idPersonagem = pf.fkPersonagem
  WHERE idUsuario = ${idUsuario};`;
  console.log("Trazendo todos os personagens favoritados: \n" + querySQL);
  return database.executar(querySQL);
}

function puxarTentativasUsuario(idUsuario) {
  let querySQL = `SELECT t.idTentativa,
       t.pontuacao,
       t.dataTentativa AS dataHora,
       DATE_FORMAT(t.dataTentativa, '%d/%m/%Y') AS dataTentativa,
       'historia' AS tipo,
       h.idHistoria AS idItem,
       h.tituloHistoria AS titulo,
       h.bannerHistoria AS banner
FROM tentativa AS t
JOIN quiz AS q ON t.fkQuiz = q.idQuiz
JOIN historia AS h ON q.fkHistoria = h.idHistoria
WHERE t.fkUsuario = ${idUsuario}

UNION ALL

SELECT t.idTentativa,
       t.pontuacao,
       t.dataTentativa AS dataHora,
       DATE_FORMAT(t.dataTentativa, '%d/%m/%Y') AS dataTentativa,
       'personagem' AS tipo,
       p.idPersonagem AS idItem,
       p.nomePersonagem AS titulo,
       p.bannerPersonagem AS banner
FROM tentativa AS t
JOIN quiz AS q ON t.fkQuiz = q.idQuiz
JOIN personagem AS p ON q.fkPersonagem = p.idPersonagem
WHERE t.fkUsuario = ${idUsuario}

ORDER BY dataHora DESC`;
  console.log("Trazendo as tentativas feitas pelo usuário: \n" + querySQL);
  return database.executar(querySQL);
}



function puxarAvaliacoesHistoria(idUsuario){
  let querySQL = `SELECT  ah.idAvaliacaoHistoria, ah.fkHistoria, h.tituloHistoria, h.bannerHistoria, h.tipoHistoria, ah.notaAvaliacao, DATE_FORMAT(ah.dataAvaliacao, '%d/%m/%Y') AS dataAvaliacao FROM historia AS h
JOIN avaliacaoHistoria AS ah ON ah.fkHistoria = h.idHistoria
WHERE ah.fkUsuario = ${idUsuario}`;
console.log("Trazendo as avaliações de um usuário: ", puxarAvaliacoesHistoria);
return database.executar(querySQL);
}

module.exports = {
  cadastrar,
  logar,
  favoritar,
  verificarFavoritado,
  removerFavorito,
  avaliar,
  verificarAvaliacao,
  alterarAvaliacao,
  puxarInformacoesUsuario,
  inserirTentativa,
  inserirAlternativaEscolhida,
  puxarHistoriasFavoritadas,
  puxarPersonagensFavoritados,
  puxarTentativasUsuario,
  puxarAvaliacoesHistoria
};
