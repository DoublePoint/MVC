<template>
  <footer class="el-footer" :style="{ height }">
    <slot></slot>
  </footer>
</template>

<script>
  export default {
    name: 'LlFooter',

    componentName: 'LlFooter',

    props: {
      height: {
        type: String,
        default: '60px'
      }
    }
  };
</script>
