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
          childAlias: String,
          idAlias: String,
          labelAlias: String,
          iconAlias: String,
        }
      },
      type:Object
    },
    expandLevel:{
      default:3,
      type:Number
    },
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
      if(node.data[this.props.childAlias]!=null&&node.data[this.props.childAlias].length>0)
        return;
      this.$request.request({
        url:this.datasource,
        params:{
          code:0
        },
        body:{
          code:0
        }
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