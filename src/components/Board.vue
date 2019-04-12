<template>
  <div>
    <div class="game-board">
      <div
        v-for="(square, idx) in board"
        :key="idx"
        class="box"
        @click="selectMove"
      >
        {{ board[idx] }}
      </div>
    </div>
  </div>
</template>

<script>
const BoardFactory = (tileCount) => {
  let board = [];

  for (let i = 0; i < tileCount; i++) {
    board.push({
      value: "",
      selected: false
    });
  }

  return board;
};
// arbitrary size, set colors, undo
export default {
  name: "Board",
  data: function() {
    return {
      board: BoardFactory(9)
    };
  },
  methods: {
    selectMove() {
      this.$emit("toggle-panel");
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
