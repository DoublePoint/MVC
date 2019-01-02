<template>
  <ll-container style="height: 100%; ">
    <ll-main style="height: 100%; ">
      <ll-table
        :data="wrap"
        height="100%"
        border
        highlight-current-row
        @current-change="currentChangeTable"
        @row-dblclick="rowDblclick"
        @row-click="rowClick"
        @select="select"
        @selection-change="selectionChange"
        :row-key="rowKey"
        :span-method="spanMethod"
        @cell-click="cellClick"
      >
        <slot></slot>
      </ll-table>
    </ll-main>
    <ll-footer height="30" v-if="showPager">
      <ll-pagination
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
  model:{},
  model: {
    prop: 'dataWrap',
    event: 'wrap-change'
  },
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
    pageSizes: {
      type: Array,
      default() {
        return [10, 20, 30, 40, 50, 100];
      }
    },
    readonly: {
      default: true,
      type: Boolean
    },
    rowKey: {
      default: "rowId",
      type: String
    },
    showPager:{
      default:true,
      type:Boolean
    }
  },
  data() {
    return {
      //当前编辑的属性为prop+index
      currentEditPropIndex: "-1",
      rowsReadonly: [],
      selectedRows: [],
      updatedRows: [],
      addedRows: []
    };
  },
  methods: {
    // event
    currentChangeTable(currentRow, oldCurrentRow) {
      this.$emit("current-row-change", currentRow, oldCurrentRow);
    },
    currentChange(currPage) {
      if (!this.dataWrap || !this.dataWrap.pageInfo) return 0;
      this.dataWrap.pageInfo.currentPageNum = currPage;
      this.$emit("current-change", currPage);
    },
    cellClick(row, column, cell, event) {
      this.$emit("cell-click", row, column, cell, event);
    },
    rowDblclick(row, event) {
      this.$emit("row-dblclick", row, event);
    },
    rowClick(row, event) {
      this.$emit("row-click", row, event);
    },

    select(selection, row) {
      try {
      } catch (error) {
      } finally {
        this.$emit("select", selection, row);
      }
    },
    selectionChange(selection) {
      try {
        this.selectedRows = selection;
      } catch (error) {
      } finally {
        this.$emit("selection-change", selection);
      }
    },
    spanMethod({ row, column, rowIndex, columnIndex }) {
      //console.log("-----------span-method");
      this.$emit("span-method", { row, column, rowIndex, columnIndex });
    },

    getSelectedRows() {
      return this.selectedRows;
    },
    getUpdatedRows() {
      return this.updatedRows;
    },
    getAddedRows() {
      return this.addedRows;
    },
    addUpdateRow(row) {
      var index = this.updatedRows.findIndex(i => i.rowId == row.rowId);
      var indexAdded = this.addedRows.findIndex(i => i.rowId == row.rowId);
      if (index == -1 && indexAdded == -1) {
        this.updatedRows.push(row);
      }
    },
    addRow(row) {
      if (this.$_.isUndefined(row.rowId)) 
        row.rowId = this.$_.uniqueId("g-r-id-");
      this.addedRows.push(row);
      if(this.dataWrap==null ||this.$_.isUndefined(this.dataWrap) )
        this.dataWrap={};
      if(this.dataWrap.dataList==null||this.$_.isUndefined(this.dataWrap.dataList))
        this.dataWrap.dataList=[];
      this.dataWrap.dataList.push(row);
      this.$emit("wrap-change",this.dataWrap);
    },
    setRowReadonly(row, prop, readonly) {
      if (readonly == null) readonly = true;
      if (this.$_.isBlank(prop) || this.$_.isUndefined(prop)) {
        var index = this.rowsReadonly.findIndex(i => i.rowId == row.rowId);
        if (index == -1) {
          this.rowsReadonly.push({ rowId: row.rowId, readonly: readonly });
        } else {
          this.rowsReadonly[index].readonly = readonly;
        }
      } else {
        var index = this.rowsReadonly.findIndex(i => i.rowId == row.rowId);
        if (index == -1) {
          this.rowsReadonly.push({
            rowId: row.rowId,
            props: [{ prop: prop, readonly: readonly }]
          });
        } else {
          var props = this.rowsReadonly[index].props;
          if (props == null || this.$_.isUndefined(props))
            props.push({ prop: prop, readonly: readonly });
          else {
            var index = props.findIndex(i => i.prop == prop);
            if (index == -1) {
              props.push({ prop: prop, readonly: readonly });
            } else {
              props[index].readonly = readonly;
            }
          }
        }
      }
    },
    getRowReadonly(row, prop) {
      var index = this.rowsReadonly.findIndex(i => i.rowId == row.rowId);
      if (this.$_.isBlank(prop) || this.$_.isUndefined(prop)) {
        if (index == -1) {
          return null;
        } else {
          return this.rowsReadonly[index].readonly;
        }
      } else {
        if (index == -1) {
          return null;
        } else {
          var props = this.rowsReadonly[index].props;
          if (props == null || this.$_.isUndefined(props)) return null;
          var index2 = props.findIndex(i => i.prop == prop);
          if (index2 == -1) {
            return null;
          } else {
            return props[index2].readonly;
          }
        }
      }
    }
  },
  computed: {
    wrap: {
      get() {
        if (!this.dataWrap) return [];
        return this.dataWrap.dataList;
      }
    }
  },
  watch: {
    dataWrap() {
      // console.log("watch---------------------wrap");
      this.updatedRows = [];
      this.selectedRows = [];
      this.addedRows = [];
    }
  }
};
</script>

<style>
</style>