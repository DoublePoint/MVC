<template>
  
  <ll-table-column v-if="type=='selection'" type="selection" width="55">
  </ll-table-column>
  <ll-table-column v-else-if="type=='index'" type="index" width="50"  :sortable="sortable">
  </ll-table-column>
  <ll-table-column v-else-if="type=='switch'" :prop="prop" :label="label" :width="width" :sortable="sortable">
      <template slot-scope="scope">
        <ll-switch
          v-model="scope.row[prop]"
          :active-color="activeColor"
          :inactive-color="inactiveColor"
          :active-value="activeValue"
          :inactive-value="inactiveValue"
          @change="valueChange(scope.row)">
			  </ll-switch>
			</template>
  </ll-table-column>
  <ll-table-column v-else :prop="prop" :label="label" :width="width" :align="align" :sortable="sortable">
    <template slot-scope="scope">
      <slot :row="scope.row">
        <div
          style="width:100%;height:100%;margin:0;padding:0"
          v-if="isReadonly(scope.row,prop,scope.row.rowId)"
          @click="handleEdit(scope.row,prop,scope.row.rowId)"
        >
          <span  style="display: inline-block;min-width: 1px;">{{ format(scope.row[prop])}}</span>
        </div>
        <span v-if="!(isReadonly(scope.row,prop,scope.row.rowId))" class="cell-edit-input">
          <ll-input
            v-if="type=='input'"
            ref="llGridColumnInput"
            :key="prop+scope.row.rowId"
            v-model="scope.row[prop]"
            @blur="clearEditIndex"
            @change="valueChange(scope.row)"
            placeholder="请输入内容"
          ></ll-input>
          <ll-select 
            v-model="scope.row[prop]" 
            filterable
            v-if="type=='select'" 
            @visible-change="handleSelectBlur"
            ref="llGridColumnInput" 
            @change="valueChange(scope.row)"
            placeholder="请选择" >
            <ll-option
              v-for="item in items"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            ></ll-option>
          </ll-select>
          <ll-drop-tree-zz v-if="type=='tree'" :datasource="datasource" v-model="scope.row[prop]" :label-datasource="labelDatasource"></ll-drop-tree-zz>
          
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
      parent:null,
      value: "",
    };
  },
  props: {
    prop: String,
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
    },
    items:{
      default(){
        return []
      },
      type:Array
    },

    // vue
    datasource: String,
    labelDatasource: String,

    //switch
    activeColor:{
      type:String
    },
    activeValue:{
      default:"1",
      type:String
    },
    inactiveValue:{
      default:"0",
      type:String
    },
    inactiveColor:{
      type:String
    },
    
  },
  methods: {
    format(val){
      if("select"==this.type){
        try{
          var index = this.items.findIndex(i=>{return i.value==val})
          if(index!=-1)
              return this.items[index].label;
        }
        catch(e){
          return val;
        }
      }
      else if("droptree"==this.type){
         this.$refs("droptree").getLabel();
      }
      return val;
    },
    owner: function(){
      if(this.parent)
        return this.parent;
      var parent=this.$parent;
      while(parent&&parent.$options.name!== 'LlTableZz'){
        parent=parent.$parent;
      }
      this.parent=parent;
      return parent;
    },
    isReadonly(row , prop ,index) {
      //如果父为readonly则子元素也为readonly
      if(this.owner().readonly)
        return true;
      if (row.rowId + "-" +prop != this.owner().currentEditPropIndex) 
        return true;
      var propReadonly = this.owner().getRowReadonly(row,prop);
      if(propReadonly == null){
        var rowReadonly = this.owner().getRowReadonly(row);
        var columnReadonly = this.readonly;
        //只要有一个为true的则为true,否则为false
        var rowNull = rowReadonly == null;
        var colNull = columnReadonly == null;
        if(rowNull && colNull)
          propReadonly = null;
        else if(rowNull && !colNull)
          propReadonly = columnReadonly;
        else if (colNull && !rowNull)
          propReadonly = rowReadonly;
        else {
          if(rowReadonly||columnReadonly)
            propReadonly = true;
          else 
            propReadonly = false;
        }
      }
      if(propReadonly == null)
        propReadonly = this.owner().readonly
      if(propReadonly == null)
        return true;
      return propReadonly;
      // var i = this.editIndexArray.findIndex(item => {
      //   return item.rowNum == index;
      // });
      // var readonly;
      // if (i != -1)
      //   //表示存在该单元格的readonly数据
      //   readonly = this.editIndexArray[i].readonly;
      // else 
      //   readonly = this.readonly;
      // //如果readonly=false 并且是当前的索引可以被编辑
      // if (!readonly) return false;
      // return true;
    },
    currentChange(currPage) {
      this.dataWrap.pageInfo.currentPageNum = currPage;
      this.$emit("current-change", currPage);
    },
    handleEdit: function(row, prop, index) {
      this.owner().currentEditPropIndex = row.rowId + "-" +prop;
      setTimeout(() => {
        if (this.$refs.llGridColumnInput) this.$refs.llGridColumnInput.focus();
      }, 200);
    },
    clearEditIndex: function(row, prop) {
      this.owner().currentEditPropIndex = "-1";
    },
    handleSelectBlur: function(val){
      //代表隐藏
      if(!val){
        this.clearEditIndex();
      }
    },
    handleNodeClick(data) {
    },
    //设置某行可被编辑
    setReadonly(isReadonly) {

    },
    valueChange(row){
      this.owner().addUpdateRow(row);
      console.log("addUpdatedRow")
    }
  },
  beforeMount: function() {
  },
  created: function() {
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