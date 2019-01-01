<template>
  <ll-popover
    placement="bottom-start"
    width="400"
    :visible-arrow="false"
    @show="showPopover"
    @hide="hidePopover"
    trigger="click"
    v-model="visible"
  >
    <ll-tree-zz
      ref="tree"
      :items="items"
      :props="defaultProps"
      :datasource="datasource"  
      accordion
      @node-click="handleNodeClick"
      @current-change="currentChange"
    ></ll-tree-zz>
    <!-- <ll-button slot="reference">click 激活</ll-button> -->
    <ll-input ref="input" slot="reference" :suffix-icon="suffixIcon" v-model="selectLabel"
      :readonly="true">
       <!-- <template slot="append">{{selectLabel}}</template> -->
    </ll-input>
  </ll-popover>
</template>

<script>

export default {
  name: "LlDropTreeZz",
  model: {
    prop: 'value',
    event: 'node-click'
  },
  props: {
    props: {
      default() {
        return {
          value: String,
          label: String,
          children: String,
          disabled: String
        };
      },
      type: Object
    },
    lazy: {
      default: true,
      type: Boolean
    },
    datasource: String,
    labelDatasource: String,
    value: "",
    items:{
      type: Array
    }
  },
  data() {
    return {
      data: [
      ],
      defaultProps: {
        children: "children",
        label: "name",
        isLeaf: "isLeaf"
      },
      suffixIcon: "el-icon-caret-bottom",
      visible:false,
      selectLabel:""
    };
  },
  computed:{
    
  },
  watch: {
    // 如果 `value` 发生改变，这个函数就会运行
    value: function (newValue, oldValue) {
      var targetNode = this.$refs["tree"].getNode(newValue);
        if(!targetNode){
          this.getShowValue();
        }
        else{
          this.selectLabel = targetNode.label;
        }
      
    }
  },
  methods: {
    focus(){
      this.$refs.input.focus();
    },
    handleNodeClick(data) {
      this.selectLabel=data.name;
      this.visible=false;
      //this.value=data.code;
      this.$emit('node-click', data.code)
    },
    showPopover() {
      this.suffixIcon="el-icon-caret-top"
    },
    getShowValue(successfunc){
      if(!this.$_.isBlank(this.selectLabel))
        return this.selectLabel;
      var _this = this 
      if(this.labelDatasource!=null){
          this.$request.request({
            url:this.labelDatasource,
            data:{
              
            },
            params:{
              code:this.value
            }
          },function(response){
            _this.selectLabel= response.bodyText;
            try{
              if(successfunc!=null)
                successfunc(response);
            }
            catch(e){
              
            }
          },function(response){
            throw new Error("ll:ajax error:"+response);
          })
      }
    },
    hidePopover() {
      this.suffixIcon="el-icon-caret-bottom";
      this.$emit("hide-droptree");
    },
    currentChange(nodeData,node){
      this.$emit("current-change",nodeData,node)
    }
  },
  created(){
     this.getShowValue();
  }
};
</script>

<style>
</style>