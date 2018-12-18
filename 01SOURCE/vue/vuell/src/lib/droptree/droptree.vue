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
    ></ll-tree-zz>
    <!-- <ll-button slot="reference">click 激活</ll-button> -->
    <ll-input slot="reference" :suffix-icon="suffixIcon" v-model="value"
      :readonly="true">
       <template slot="append">{{selectLabel}}</template>
    </ll-input>
  </ll-popover>
</template>

<script>
export default {
  name: "LlDropTreeZz",
  model: {
    prop: 'value',
    event: 'change1'
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
      default(){
        return [];
      },
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
      selectLabel:"",
      suffixIcon: "el-icon-caret-bottom",
      visible:false
    };
  },
  watch: {
    // 如果 `value` 发生改变，这个函数就会运行
    value: function (newValue, oldValue) {
      var targetNode = this.$refs["tree"].getNode(newValue);
        if(!targetNode){
          this.getLabel();
        }
        else{
          this.selectLabel = targetNode.label;
        }
      
    }
  },
  methods: {
    handleNodeClick(data) {
      this.selectLabel=data.name;
      this.visible=false;
      this.$emit('change1', data.code)
    },
    showPopover() {
      this.suffixIcon="el-icon-caret-top"
    },
    getLabel(){
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
          },function(response){
            throw new Error("ll:ajax error:"+response);
          })
      }
    },
    hidePopover() {
      this.suffixIcon="el-icon-caret-bottom"
    },
  },
  created(){
    this.getLabel();
  }
};
</script>

<style>
</style>