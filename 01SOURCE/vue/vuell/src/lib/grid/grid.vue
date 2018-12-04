<template>
  <ll-container style="height: 100%; ">
    <ll-main style="height: 100%; ">
      <ll-table :data="wrap" height="100%" border highlight-current-row  @cell-click="testCellClick">
        <slot ></slot> 
      </ll-table>
    </ll-main>
    <ll-footer height="30">
      <ll-pagination
        background
        layout="prev, pager, next"
        :current-page="dataWrap.pageInfo.currentPageNum"
        :total="dataWrap.pageInfo.totalElementCount"
        @current-change="currentChange"
      ></ll-pagination>
    </ll-footer>
  </ll-container>
</template>

<script>
export default {
  name: "LlGrid",
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
    data: {
      default() {
        return [];
      },
      type: Array
    }
  },
  methods: {
    currentChange(currPage) {
      this.dataWrap.pageInfo.currentPageNum=currPage;
      this.$emit("current-change", currPage);
    },
    testCellClick(){
      // alert(123)
      this.$emit("cell-click", 2);
    }
  },
  computed: {
    wrap: function() {
      return this.dataWrap.dataList;
    }
  },
  watch: {}
};
</script>

<style>
</style>