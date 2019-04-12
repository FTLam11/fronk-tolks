<template>
  <div id="app">
    <img alt="Vue logo" src="./assets/logo.png" />
    <Panel :isActive="activePanel"/>
    <Board @toggle-panel="togglePanel"/>
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
  },
  data: function() {
    return {
      activePanel: false
    };
  },
  methods: {
    togglePanel() {
      this.activePanel = !this.activePanel;
    }
  }
};
</script>

<style>
#app {
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
</style>
