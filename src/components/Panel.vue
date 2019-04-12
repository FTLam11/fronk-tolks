<template>
  <div class="control-panel">
    <div
      v-for="(move, index) in moves"
      :key="index"
      @click="markTile(move)"
      class="move"
    >
      {{ move }}
    </div>
  </div>
</template>

<script>
export default {
  name: "Panel",
  data: function() {
    return {
      moves: ["X", "O"]
    };
  },
  methods: {
    markTile: function(move) {
      this.$root.$emit("mark-tile", move);
    }
  }
};
</script>
<style scoped>
.control-panel {
  display: flex;
  justify-content: center;
  align-items: center;
  margin-bottom: 10px;
}

.move {
  background-color: #5295ae;
  color: #fff;
  border: 6px solid #2c3e50;
  border-radius: 10px;
  width: 100px;
}
</style>
