<template>
  <header class="el-header" :style="{ height }">
    <slot></slot>
  </header>
</template>

<script>
  export default {
    name: 'LlHeader',

    componentName: 'LlHeader',

    props: {
      height: {
        type: String,
        default: '60px'
      }
    }
  };
</script>
