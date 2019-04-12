<template>
  <div class="hello">
    <div class="game-board">
      <div class="box"></div>
      <div class="box"></div>
      <div class="box"></div>
      <div class="box"></div>
      <div class="box"></div>
      <div class="box"></div>
      <div class="box"></div>
      <div class="box"></div>
      <div class="box"></div>
    </div>
  </div>
</template>

<script>
// arbitrary size, set colors, undo
export default {
  name: "HelloWorld",
  data: function() {
    return {
      board: ["", "", "", "", "", "", "", "", ""]
    }
  }
};
</script>

<style scoped>
.game-board {
  width: 600px;
  height: 600px;
  margin: 0 auto;
  background-color: #52aea0;
  color: #fff;
  border: 6px solid #2c3e50;
  border-radius: 10px;
  display: grid;
  grid-template: repeat(3, 1fr) / repeat(3, 1fr);
}

.box {
  border: 6px solid #2c3e50;
  border-radius: 2px;
  display: flex;
  justify-content: center;
  align-items: center;
}
</style>
