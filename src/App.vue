<template>
  <div id="app">
    <h3>Tic Tac Toe</h3>
    <Panel />
    <Board />
  </div>
</template>

<script>
import Board from "./components/Board.vue";
import Panel from "./components/Panel.vue";

export default {
  name: "app",
  components: {
    Board,
    Panel
  }
};
</script>

<style>
#app {
  font-family: Helvetica;
  font-weight: bold;
  font-size: 4em;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

h3 {
  margin: 0 0 10px 0;
}
</style>
