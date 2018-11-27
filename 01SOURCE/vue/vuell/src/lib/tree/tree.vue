<template>
    <ll-tree :data="items" :props="props" accordion @node-click="handleNodeClick" :load="load">
    </ll-tree>
</template>

<script>

export default {
  name: "LlNavTree",
  props: {
    items: {
      type: Array
    },
    props:{
      default(){
        return{
          childAlias: String,
          idAlias: String,
          labelAlias: String,
          iconAlias: String,
        }
      },
      type:Object
    },
  },
  data() {
    return {
    };
  },
  methods: {
    handleNodeClick(nodeData,node) {
        this.$emit("node-click",nodeData,node);
    },
    load(node, resolve){
        if(node[childAlias]!=null&&node[childAlias].length>0){

        }
    }
  },
  watch:{
    
  }
};
</script>

<style>
 
</style>