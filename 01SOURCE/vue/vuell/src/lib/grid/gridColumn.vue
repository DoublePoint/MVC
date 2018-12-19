<template>
  <ll-table-column :prop="prop" :label="label" :width="width" :align="align" :sortable="sortable">
    <template slot-scope="scope">
      <slot :row="scope.row">
        <div
          style="width:100%;height:100%;margin:0;padding:0"
          v-if="isReadonly(scope.row,prop,scope.$index)"
          @click="handleEdit(scope.row,prop,scope.$index)"
        >
          <span style="display: inline-block;min-width: 1px;">{{ scope.row[prop]}}</span>
        </div>
        <span v-if="!(isReadonly(scope.row,prop,scope.$index))" class="cell-edit-input">
          <ll-input
            v-if="type=='input'"
            ref="llGridColumnInput"
            :key="prop+scope.$index"
            v-model="scope.row[prop]"
            placeholder="请输入内容"
            @blur="clearEditIndex(scope.row,prop)"
          ></ll-input>
          <ll-select 
            v-model="scope.row[prop]" 
            filterable
            v-if="type=='select'" 
            @visible-change="handleSelectBlur"
            @blur="clearEditIndex(scope.row,prop)"
            ref="llGridColumnInput" 
            placeholder="请选择" >
            <ll-option
              v-for="item in options"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            ></ll-option>
          </ll-select>
          <ll-tree  v-if="type=='tree'" :data="data" :props="defaultProps" @node-click="handleNodeClick"></ll-tree>
           <ll-date-picker
              v-if="type=='date'" 
              v-model="scope.row[prop]"
              editable
              @blur="clearEditIndex(scope.row,prop)"
              ref="llGridColumnInput"
              type="date"
              placeholder="选择日期">
            </ll-date-picker>
        </span>
      </slot>
    </template>
    <template slot-scope="scope" slot="header">
      <slot :row="scope.row" name="header">{{label}}</slot>
    </template>
  </ll-table-column>
</template>

<script>
export default {
  name: "LlTableColumnZz",
  data() {
    return {
      editIndexArray: [],
      // currentEditIndex: "-1",
      parent:null,
      options: [
        {
          value: "选项1",
          label: "黄金糕"
        },
        {
          value: "选项2",
          label: "双皮奶"
        },
        {
          value: "选项3",
          label: "蚵仔煎"
        },
        {
          value: "选项4",
          label: "龙须面"
        },
        {
          value: "选项5",
          label: "北京烤鸭"
        }
      ],
      value: "",

data: [{
          label: '一级 1',
          children: [{
            label: '二级 1-1',
            children: [{
              label: '三级 1-1-1'
            }]
          }]
        }, {
          label: '一级 2',
          children: [{
            label: '二级 2-1',
            children: [{
              label: '三级 2-1-1'
            }]
          }, {
            label: '二级 2-2',
            children: [{
              label: '三级 2-2-1'
            }]
          }]
        }, {
          label: '一级 3',
          children: [{
            label: '二级 3-1',
            children: [{
              label: '三级 3-1-1'
            }]
          }, {
            label: '二级 3-2',
            children: [{
              label: '三级 3-2-1'
            }]
          }]
        }],
        defaultProps: {
          children: 'children',
          label: 'label'
        },
        value1:"2018/12/07"

    };
  },
  props: {
    prop: String,
    istemplate: {
      default: false,
      type: Boolean
    },
    label: String,
    width: {
      default: 100,
      type: Number
    },
    align: {
      default: "left",
      type: String
    },
    readonly: {
      default: false,
      type: Boolean
    },
    sortable: {
      default: true,
      type: Boolean
    },
    type: {
      default: "input",
      type: String
    }
  },
  methods: {
    owner: function(){
      if(this.parent)
        return this.parent;
      var parent=this.$parent;
      while(parent&&parent.$options.name!== 'LlTableZz'){
        parent=parent.$parent;
      }
      this.parent=parent;
      console.log(parent)
      return parent;
    },
    isReadonly(row,prop, index) {
      //如果父为readonly则子元素也为readonly
      if(this.owner().readonly)
          return true;
      // console.log("执行了isReadonly方法 prop="+prop+" index="+index+" this.currentEditIndex="+this.currentEditIndex);
      //if (prop + index != this.currentEditIndex) return true;
      if (prop + index != this.owner().currentEditPropIndex) return true;
      var i = this.editIndexArray.findIndex(item => {
        return item.rowNum == index;
      });
      var readonly;
      if (i != -1)
        //表示存在该单元格的readonly数据
        readonly = this.editIndexArray[i].readonly;
      else 
        readonly = this.readonly;
      //如果readonly=false 并且是当前的索引可以被编辑
      if (!readonly) return false;
      return true;
    },
    currentChange(currPage) {
      this.dataWrap.pageInfo.currentPageNum = currPage;
      this.$emit("current-change", currPage);
    },
    handleEdit: function(row, prop, index) {
      // console.log("handleEdit"+prop)
      this.owner().currentEditPropIndex = prop+index;
      setTimeout(() => {
        // console.log(this.$refs.llGridColumnInput)
        if (this.$refs.llGridColumnInput) this.$refs.llGridColumnInput.focus();
      }, 200);
    },
    clearEditIndex: function(row, prop) {
      // setTimeout(() => {
        this.owner().currentEditPropIndex = "-1";
      // },200);
    },
    handleSelectBlur: function(val){
      // console.log("handleSelectBlur")
      //代表隐藏
      if(!val){
        // alert("false")
        this.clearEditIndex();
      }
    },
    handleNodeClick(data) {
        // console.log(data);
      },
    //设置某行可被编辑
    setReadonly(isReadonly) {}
  },
  beforeMount: function() {
    // console.log("beforeMount----");
    // console.log(this.$scopedSlots);
  },
  created: function() {
    // console.log("created----");
    // console.log(this.$scopedSlots);
  },
  computed: {
    wrap: function() {
      return this.dataWrap.dataList;
    },
    
  },
  watch: {}
};
</script>

<style lang="less">
.el-table {
  .cell {
    overflow: visible;
    overflow-y: visible;
  }
  .cell>div {
    overflow: hidden;
  }
  th {
    div {
      overflow: visible;
      overflow-y: visible;
    }
    padding: 0px 0;
  }
}
.el-input__icon {
    line-height: 30px;
}
</style>