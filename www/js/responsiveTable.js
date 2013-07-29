$(document).on('click', '.selectable tbody tr', function(){
	var el = $(this);
	$(this).siblings().removeClass("rowSelected");
	$(this).addClass("rowSelected", this.clicked);
	el.trigger("change");
});	
var selectRowBinding = new Shiny.InputBinding();
$.extend(selectRowBinding, {
	find: function(scope) {
		var res = $(scope).find(".selectable");
		return res;
	},
	getValue: function(el){
		var res = $(el).children().children('.rowSelected').index();
		return res;
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
