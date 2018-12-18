<template>
  <ll-container style="height: 100%; ">
    <ll-main style="height: 100%; ">
      <ll-table :data="wrap" height="100%" border highlight-current-row  
        @row-dblclick="rowDblclick"
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
const store = new Vuex.Store({
  state: {
    count: 0
  },
  mutations: {
    increment (state) {
      state.count++
    }
  }
})
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
  },
  
  methods: {
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
    }
  },
  computed: {
    wrap: function() {
      if(!this.dataWrap) return [];
      return this.dataWrap.dataList;
    }
  },
  watch: {}
};
</script>

<style>
</style>