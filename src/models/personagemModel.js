var database = require("../database/config");

function buscarPersonagensBatman() {
  // Buscando somente personagens que são Batman
  let querySQL = `SELECT * FROM personagem WHERE nomePersonagem LIKE "%Batman%";`;
  console.log("Executando a query para buscar Batmans: \n" + querySQL);
  return database.executar(querySQL);
}

function buscarPersonagensAliados() {
  let querySQL = `SELECT * FROM personagem WHERE nomePersonagem NOT LIKE "%Batman%" AND (categoriaPersonagem = "Herói" OR categoriaPersonagem = "Anti-Herói");`;
  console.log(`Buscando personagens Aliados (herói ou anti-herois): \n`, querySQL);
  return database.executar(querySQL);
}

function buscarPersonagensViloes() {
  let querySQL = `SELECT * FROM personagem WHERE categoriaPersonagem = "Vilão";`;
  console.log(`Buscando personagens vilões: \n`, querySQL);
  return database.executar(querySQL);
}

function buscarPersonagemEspecifico(idPersonagem){
  let querySQL = `SELECT p.*, ce.textoComentarioEditor FROM personagem AS p LEFT JOIN comentarioEditor AS ce ON ce.fkPersonagem = p.idPersonagem WHERE idPersonagem = ${idPersonagem}`;
  console.log("Buscando personagem com o id ", idPersonagem);
  return database.executar(querySQL);
}

function contarPersonagens(){
    let querySQL = `SELECT COUNT(idPersonagem) AS qntPersonagens FROM personagem;`;
    return database.executar(querySQL);
}

function personagensMaisFavoritados(){
      let querySQL = `SELECT p.idPersonagem, p.nomePersonagem, p.bannerPersonagem, COUNT(af.fkPersonagem) AS qntFavoritos 
      FROM personagem AS p
      INNER JOIN personagensFavoritados AS af ON af.fkPersonagem = p.idPersonagem
    GROUP BY p.idPersonagem, p.nomePersonagem, p.bannerPersonagem
      ORDER BY qntFavoritos DESC
      LIMIT 3`;
    return database.executar(querySQL);
}

function selecionarTodosPersonagens(){
      let querySQL = `SELECT * FROM personagem`;
    return database.executar(querySQL);
}
module.exports = {
  buscarPersonagensBatman,
  buscarPersonagensAliados,
  buscarPersonagensViloes,
  buscarPersonagemEspecifico,
  contarPersonagens,
  personagensMaisFavoritados,
  selecionarTodosPersonagens
  
};
