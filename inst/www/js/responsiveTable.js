$(document).on('click', '.selRow tbody tr', function(){
	var el = $(this);
	$(this).siblings().removeClass("cellsSelected");
	$(this).addClass("cellsSelected", this.clicked);
	el.trigger("change");
});	
var selectRowBinding = new Shiny.InputBinding();
$.extend(selectRowBinding, {
	find: function(scope) {
		return $(scope).find(".selRow");
	},
	getValue: function(el){
		return $(el).children().children('.cellsSelected').index();
	},
	setValue: function(el, value) {
	},
	subscribe: function(el, callback) {
		$(el).on("change.selectRowBinding", function(e) {
			callback();
		});
	},
	unsubscribe: function(el) {
	  $(el).off(".selectRowBinding");
	}
});
Shiny.inputBindings.register(selectRowBinding);

$(document).on('click', '.selCell tbody td', function(){
	var el = $(this);
	$(this).parent().parent().children().children().removeClass("cellsSelected");
	$(this).addClass("cellsSelected", this.clicked);
	el.trigger("change");
});	
var selectCellBinding = new Shiny.InputBinding();
$.extend(selectCellBinding, {
	find: function(scope) {
		return $(scope).find(".selCell");;
	},
	getValue: function(el){
		var rowIndex = $(el).children().children().children('.cellsSelected').parent().index();		
		if (rowIndex==-1)
			return -1;
		var colIndex = $(el).children().children().children('.cellsSelected').index() + 1;
		return [rowIndex, colIndex];
	},
	setValue: function(el, value) {
	},
	subscribe: function(el, callback) {
		$(el).on("change.selectCellBinding", function(e) {
			callback();
		});
	},
	unsubscribe: function(el) {
	  $(el).off(".selectCellBinding");
	}
});
Shiny.inputBindings.register(selectCellBinding);
