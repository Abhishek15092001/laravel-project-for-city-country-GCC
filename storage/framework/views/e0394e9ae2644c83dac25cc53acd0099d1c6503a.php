<?php $__env->startSection('content'); ?>
<div class="container">
    <div class="row">
        <div class="col-md-20 col-md-500">
            <div class="panel panel-default">
                <div class="panel-heading">Dashboard
                    <button id="groupBtn" type="submit" class="btn btn-wh-or mb-200 btn-orange" data-toggle="modal" data-target="#groupData" >Group Data</button>
                    <button id="syncBtn" type="submit" class="btn btn-wh-or mb-200 btn-orange" data-toggle="modal" data-target="#sync" >Sync Data</button>
                </div>
                <div class="panel-body">
                    <?php if(session('status')): ?>
                        <div class="alert alert-success">
                            <?php echo e(session('status')); ?>

                        </div>
                    <?php endif; ?>

                    <div class="table-responsive">
                        <table id="datatable-scroll" class="table table-striped table-bordered dataTable no-bottom-margin" width="100%">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Country</th>
                                <th>Region</th>
                                <th>Capital City</th>
                                <th>Population</th>
                                <th>Created At</th>
                                <th>Updated At</th>
                            </tr>
                            <tr>
                                <th>ID</th>
                                <th>Country</th>
                                <th>Region</th>
                                <th>Capital City</th>
                                <th>Population</th>
                                <th>Created At</th>
                                <th>Updated At</th>
                            </tr>
                        </thead>
                    </table>
                </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal Sync -->
<div id="sync" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header modal-header-custom">

                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Sync Data</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <h5><span>Sync The Data From Thirdparty Api.</span><h5>
                </div>
            </div>
            <div class="modal-footer">
                <div>
                    <button id="syncData" type="button" class="btn" data-dismiss="modal">Sync</button>
                    <button type="button" class="btn btn-wh-or" data-dismiss="modal">Cancel</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal Sync End-->

<!-- Modal Add Group Data start -->
<div  id="groupData" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header modal-header-custom">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Add Group Data</h4>
            </div>
            <div class="modal-body" style="max-height:fit-content;">
                <form id="group_submit">
                    <div class="tab-content no-padding">
                        <div role="tabpanel" class="tab-pane active form-data" id="basic_info">
                            <div class="form-group col-md-5 pr_0 required" style="padding-left: 0px;">
                                <div class="form-group col-md-12 pl_0">
                                    <label for="dscription-text" class="label-title">Grouped Data</label>
                                    <div style="width: 300px; height:100%; overflow: auto">
                                        <ul id="selectedDataList"></ul>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group col-md-5 pr_0 required" style="padding-left: 0px;">
                                <label for="groupData" class="col-sm-7 control-label label-title" style="padding-left: 0px;">Group Name</label>
                                <input type="text" id="add_groupData" class="form-control" required="required" placeholder="Enter Group Name"/>
                                <label for="country_php" class="col-sm-7 control-label label-title" style="padding-left: 0px;">Countries</label>
                                <select id="country_php" class="form-control selectpicker" data-live-search="true">
                                    <option value="">Select Country</option>
                                </select>
                                <label for="city_php" class="col-sm-7 control-label label-title" style="padding-left: 0px;">City</label>
                                <select id="city_php" class="form-control selectpicker" data-live-search="true">
                                    <option value="">Select City</option>
                                </select>
                                <div>
                            </div>
                            </div>
                            <div class="clearfix">
                            </div>
                            <div class="modal-footer">
                            <div>
                                <button id="group_submit" type="submit" class="btn btn-wh-or" >Submit</button>
                                <button type="button" class="btn btn-wh-or" data-dismiss="modal">Cancel</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Group Data Add Group Data End-->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.8/js/jquery.dataTables.min.js" defer></script>
<script type="text/javascript">
    $(document).ready(function()
    {
        // Setup - add a text input to each header cell
        $('#datatable-scroll thead tr:eq(1) th').each( function () {
            var title = $('#datatable-scroll thead tr:eq(0) th').eq( $(this).index() ).text();
            $(this).html( '<input type="text" placeholder="'+title+'" />' );
        } ); 
        // load all Data server side
        loadAllData = function() {
        table = $('#datatable-scroll').DataTable( {
            orderCellsTop:  true,
            fixedColumns:   true,
            paging:         "full_numbers",
            columnDefs: [
                // { "targets": [0], "searchable": true, "orderable": true, "visible": true },
                // { "targets": [6], "searchable": true, "orderable": true, "visible": true }
            ],
            "processing": true,
            "serverSide": true,
            "ajax": {
                "url": "<?php echo url('/api/admin'); ?>",
                "type": "POST",
                "data": {
                    access_token: "fyi8oConfA7SltIceta1v6T3WiwgaQfl42bH8TF", 
                    for:"get_all_data"
                }
            },
            "columns": [
                { "data": "id" },
                { "data": "name" },
                { "data": "region" },
                { "data": "capital_city" }, 
                { "data": "population" }, 
                { "data": "created_at" }, 
                { "data": "updated_at" }, 
            ]
        });
        // Hiding common search bar
        $("#datatable-scroll_filter").hide();
        $("#datatable-sorting_filter").hide();
        }
        // Loading Data
        loadAllData();
        // Apply the search
        table.columns().every(function (index) {
            $('#datatable-scroll thead tr:eq(1) th:eq(' + index + ') input').on('keyup change', function () {
                table.column($(this).parent().index() + ':visible')
                    .search(this.value)
                    .draw();
            });
        }); 

        $('#syncData').on('click', function() {
            if(confirm("Are you sure you want to sync the data?")==true){
                var apiUrl = "<?php echo url('/getDetails');?>";
                var data = {
                    _token: "<?php echo e(csrf_token()); ?>",
                };
                $.ajax({
                    type: "POST",
                    url: apiUrl,
                    data: data,
                    error: function (result) {
                    },
                    success: function (result) {
                        var result = JSON.parse(result);
                        alert(result.message);
                    },
                });            
            }else{
                exit();
            }
        });
        populateDD = function (dataArr, id, defaultVal) {
            $('#'+id).html('');
            $('#'+id).append("<option value=''>" + defaultVal + "</option>");

            $.each(dataArr, function(key, value) {
                $('#'+id).append("<option>" + value + "</option>");
            });
        }

        $.post("<?php echo url('/api/admin'); ?>", {for:"country_list", access_token: "xDhiYeCP5JUM4PWGaHqCb4yKVeAZY30TIDk3GtY", section:"dropdown"}, function(result)
        {
            populateDD(result.country, 'country_php', 'Select Country');
        });
        $.post("<?php echo url('/api/admin'); ?>", {for:"capital_city_list", access_token: "xDhiYeCP5JUM4PWGaHqCb4yKVeAZY30TIDk3GtY", section:"dropdown"}, function(result)
        {
            populateDD(result.city, 'city_php', 'Select City');
        });
        
        function addDataToList(selectedData) {

            var listData = document.createElement("li");
            listData.textContent = selectedData.textContent;

            document.getElementById("selectedDataList").appendChild(listData);
        }

        var selectedCity = document.getElementById("city_php");
        var selectedCountry = document.getElementById("country_php");

        selectedCity.addEventListener("change", function () {
        var selectedOption = selectedCity.options[selectedCity.selectedIndex];

        addDataToList(selectedOption);
        
        selectedCity.selectedIndex = 0;
        });

        selectedCountry.addEventListener("change", function () {
        var selectedOption = selectedCountry.options[selectedCountry.selectedIndex];

        addDataToList(selectedOption);
        
        selectedCountry.selectedIndex = 0;
        });
        
        $('#group_submit').submit(function(event)
        {
            event.preventDefault();
            var liElements = document.querySelectorAll("#selectedDataList li");
            var values = [];
            liElements.forEach(function(li) {
                values.push(li.textContent);
            });
           
            var groupName =$("#add_groupData").val();
            var groupData =values;
            $.post("<?php echo url('/api/admin'); ?>", {
                for:"create_group",
                access_token: "olDToUvIRkKwfosrIUhqOZXLLC2aYQmtQa7fHjN",
                group_name: groupName,
                data_list: groupData
            }, function(result)
            {
                alert(result.message);
                window.location.reload();
            });
        });
    });
</script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>