<template>
  <ll-container style="height: 100%; ">
    <ll-main style="height: 100%; ">
      <ll-table :data="wrap" height="100%" border highlight-current-row  
        @row-dblclick="rowDblclick"
        @select="select"
        @selection-change="selectionChange"
        :row-key="rowKey"
        @cell-click="cellClick">
        <slot ></slot> 
      </ll-table>
    </ll-main>
    <ll-footer height="30">
      <ll-pagination
        background
        layout="prev, pager, next"
        :current-page="dataWrap==null?0:dataWrap.pageInfo.currentPageNum"
        :total="dataWrap==null?0:dataWrap.pageInfo.totalElementCount"
        :page-size="dataWrap==null?10:dataWrap.pageInfo.pageSize"
        :page-sizes="pageSizes"
        @current-change="currentChange"
      ></ll-pagination>
    </ll-footer>
  </ll-container>
</template>

<script>

export default {
  name: "LlTableZz",
  props: {
    border: {
      type: Boolean,
      default: true
    },
    highlightCurrentRow: {
      type: Boolean,
      default: true
    },
    dataWrap: {
      type: Object
    },
    pageSizes:{
      type:Array,
      default(){
        return [10, 20, 30, 40, 50, 100];
      }
    },
    readonly: {
      default: true,
      type: Boolean
    },
    rowKey:{
      default: "rowId",
      type: String
    }
  },
  data(){
    return{
      //当前编辑的属性为prop+index
      currentEditPropIndex:"-1",
      selectedRows:[],
      updatedRows:[]
    };
  },
  methods: {
    // event
    currentChange(currPage) {
      if(!this.dataWrap||!this.dataWrap.pageInfo) return 0;
      this.dataWrap.pageInfo.currentPageNum=currPage;
      this.$emit("current-change", currPage);
    },
    cellClick(row, column, cell, event){
      this.$emit("cell-click", row, column, cell, event);
    },
    rowDblclick(row, event){
      this.$emit("row-dblclick", row, event);
    },
    select(selection, row){
      try {
      } catch (error) {
        
      } finally {
        this.$emit("select", selection, row);
      }
    },
    selectionChange(selection){
      try {
        this.selectedRows = selection;
      } catch (error) {
        
      } finally {
        this.$emit("selection-change", selection);
      }
    },

    getSelectedRows(){
      return this.selectedRows;
    },
    getUpdatedRows(){
      return this.updatedRows;
    },
    getAddedRows(){

    },
    addUpdateRow(row){
      var index = this.updatedRows.findIndex(i=>i.rowId==row.rowId);
      if(index==-1){
        this.updatedRows.push(row);
      }
    }
  },
  computed: {
    wrap: function() {
      console.log("---------------------wrap")
      if(!this.dataWrap) return [];
      return this.dataWrap.dataList;
    }
  },
  watch: {}
};
</script>

<style>
</style>