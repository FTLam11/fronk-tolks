<template>
  <div id="app">
    <img alt="Vue logo" src="./assets/logo.png" />
    <Board />
  </div>
</template>

<script>
import Board from "./components/Board.vue";

export default {
  name: "app",
  components: {
    Board
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
</style>
