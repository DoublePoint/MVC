<template>
    <ll-tree :data="items" :props="props" accordion @node-click="handleNodeClick" :load="load"
      :expand-on-click-node="false"
      ref="tree"
      node-key="code"
      :show-checkbox="showCheckbox"
      :lazy="lazy">
    </ll-tree>
</template>

<script>

export default {
  name: "LlTreeZz",
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
    datasource:String,
    showCheckbox:{
      default:false,
      type:Boolean
    }
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
       if (node.level === 0) {
          return resolve([{ name: '菜单树' }]);
        }
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
    },
    getNode(node){
      return this.$refs["tree"].getNode(node);
    }
  },
  watch:{
    
  }
};
</script>

<style>
 
</style>