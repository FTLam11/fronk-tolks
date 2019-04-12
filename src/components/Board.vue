<template>
  <div>
    <div class="game-board">
      <div
        v-for="(tile, idx) in board"
        :key="idx"
        class="box"
        :class="{ selected: idx === activeTileIdx }"
        @click="selectMove(tile, idx)"
      >
        {{ tile }}
      </div>
    </div>
  </div>
</template>

<script>
const BoardFactory = tileCount => {
  let board = [];

  for (let i = 0; i < tileCount; i++) {
    board.push("");
  }

  return board;
};
// arbitrary size, set colors, undo
export default {
  name: "Board",
  data: function() {
    return {
      board: BoardFactory(9),
      activeTileIdx: null
    };
  },
  methods: {
    selectMove(tile, tile_idx) {
      this.activeTileIdx = tile_idx;
    }
  },
  mounted() {
    this.$root.$on("mark-tile", move => {
      this.board.splice(this.activeTileIdx, 1, move);
    });
  }
};
</script>

<style scoped>
.game-board {
  width: 500px;
  height: 500px;
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

.selected {
  background-color: #cae8e4d9;
}
</style>
