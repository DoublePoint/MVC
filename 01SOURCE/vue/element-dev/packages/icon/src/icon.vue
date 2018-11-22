<template>
  <i :class="'el-icon-' + name"></i>
</template>

<script>
  export default {
    name: 'LlIcon',

    props: {
      name: String
    }
  };
</script>
