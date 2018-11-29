<template>
    <ll-tree :data="items" :props="props" accordion @node-click="handleNodeClick" :load="load"
      :lazy="lazy">
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
          label: String,
          children: String,
          disabled: String,
          isLeaf: String
        }
      },
      type:Object
    },
    // expandLevel:{
    //   default:3,
    //   type:Number
    // },
    lazy:{
      default:true,
      type:Boolean
    },
    datasource:String
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
      if(this.datasource==null||this.datasource=="")
        throw new Error("ll:prop 'datasource' must not be null",'tree.vue');
      var nodeData=node.data;
      if(nodeData[this.props.children]!=null&&nodeData[this.props.children].length>0)
        return;
      if(node.level==0){
        nodeData=null;
      }
      
      this.$request.request({
        url:this.datasource,
        data:nodeData
      },function(response){
        var data=response.data;
        resolve(data);
      },function(response){
        throw new Error("ll:ajax error:"+response,'tree.vue');
      })
    }
  },
  watch:{
    
  }
};
</script>

<style>
 
</style>