<template>
    <ll-tree :data="items" :props="props" accordion @node-click="handleNodeClick" :load="load"
      :expand-on-click-node="false"
      ref="tree"
      node-key="code"
      :show-checkbox="showCheckbox"
      @current-change="currentChange"
      :lazy="lazy">
      <span slot-scope="scope" style="display:inline-block;width:100%;">
          <slot :node="scope.node" :data="scope.data">
            <span class="el-tree-node__label">{{ scope.node.label }}</span>
          </slot>
      </span>
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
          label: {
            default:"name",
            type: String
          },
          children: {
            default:"children",
            type: String
          },
          disabled: String,
          isLeaf: {
            default:"children",
            type: isLeaf
          }
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
    },
    root(){
      return  menu = {
           	code:"",
            title:"",
            name:"",
            isLeaf:false,
            prop1:"",
            prop2:"",
            prop3:"",
            prop4:"",
            prop5:"",
            prop6:[]
         };
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
      // if (node.level === 0) {
      //    return resolve([{ name: '菜单树' }]);
      // }
      if(this.datasource==null||this.datasource=="")
        throw new Error("ll:prop 'datasource' must not be null",'tree.vue');
      var nodeData=node.data;
      console.log(nodeData)
       if(this.$_.isUndefined(nodeData))
         nodeData=null;
      if(nodeData!=null){
        if(nodeData[this.props.children]!=null&&nodeData[this.props.children].length>0)
          return;
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
    },
    getCurrentNode(){
      return this.$refs.tree.getCurrentNode();
    },
    currentChange(nodeData,node){
      this.$emit("current-change",nodeData,node)
    }
  },
  watch:{
    
  }
};
</script>

<style>
  
</style>