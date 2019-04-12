<template>
  <div :class="{ inactive: !isActive }">
    <div class="control-panel">
      <div v-for="(move, index) in moves" :key="index" class="move">{{ move }}</div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Panel",
  props: ["isActive"],
  data: function() {
    return {
      moves: ["X", "O"]
    };
  }
};
</script>
<style scoped>
.inactive {
  visibility: hidden;
}

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
