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
    // 如果 `question` 发生改变，这个函数就会运行
    value: function (newValue, oldValue) {
      if(!this.items)
        return;
      var targetNode = this.$refs["tree"].getNode(newValue);
      if(!targetNode){
        
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
    hidePopover() {
      this.suffixIcon="el-icon-caret-bottom"
    },
  }
};
</script>

<style>
</style>