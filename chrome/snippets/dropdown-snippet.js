 var featureSelect2Keys = function (eventOpen) {
                    var $selected_id_field = $(eventOpen.target);
                    var getHighlighted = function (eventSelection) {
                        if (eventSelection.keyCode === 13) {
                            var highlighted = $selected_id_field.data('select2').$dropdown.find('.select2-results__option--highlighted');
                            var selected = highlighted.attr('aria-selected');
                            if (highlighted) {
                                var data = highlighted.data('select2-id');
                                // setting the item value configured
                                var dataCleared = data.substring(data.lastIndexOf('-') + 1 , data.length);
                                // selecting if highligted is not selected or whitout data
                                if(dataCleared) {
                                    // selecting
                                    // if (selected === 'false') {
                                    //     var vals = $selected_id_field.val();
                                    //     if (vals === null) {
                                    //         vals = [];
                                    //     }
                                    //     if (vals.constructor === Array) {
                                    //         vals.push(dataCleared);
                                    //     } else {
                                    //         vals = dataCleared;
                                    //     }
                                    //     highlighted.attr('aria-selected', selected);
                                    //     $selected_id_field.val(vals).trigger('change');
                                    // }
                                    //deselecting
                                    if (selected === 'true') {
                                        var arr = [];
                                        var newData = $.grep($('select').select2('data'), function (value) {
                                            return value['id'] != dataCleared;
                                        });
                                        newData.forEach(function(data){
                                            arr.push(+data.id);
                                        });
                                        highlighted.attr('aria-selected', selected);
                                         $selected_id_field.val(arr).trigger('change');
                                    }
                                }
                            }
                        }
                    };

                   // $('.select2-search__field').on('keypress', getHighlighted);
                    if(eventOpen.type != 'select2:close') {
                        $('.select2-search__field').on('keypress', function (el) {
                            //if(el) {
                            getHighlighted(el);
                            // }
                        });
                    }

                }
                    element.on('select2:open', 'select', function (e) {
                       // if(e.type === 'select2:open') {
                            featureSelect2Keys(e);
                      //  }
                    });


                element.on('select2:close', 'select', function (e) {
                    //to prevent multiple triggers
                    featureSelect2Keys(e);
                    setTimeout(function () {
                        $('.select2-search__field').off('keypress');
                    }, 10);
                });