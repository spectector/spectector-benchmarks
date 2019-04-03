/*jshint esversion: 6 */

var sort_dir = false;
var showing = true;

// Load stats json file
function loadjs(file, def, callback) {
    if(file=="") { file = def; } // If no file is declared
    var script = document.createElement("script");
    script.type = "text/javascript";
    script.src = file;
    script.onload=callback;
    document.body.appendChild(script);
}

function init(){
    var stats = stats_results(results);
    document.getElementById("stats").innerText += "Stats of "+stats.total+" functions ("+stats.analyzed+" analyzed, "+stats.complete+" complete)";
    var table = document.createElement("table");
    var row = document.createElement("tr");
    for (var x in stats){
	if (x != "total" && x != "analyzed" && x != "complete"){
	    var cell = document.createElement("td");
	    var button = document.createElement("button");
	    var legend = document.createElement("div");
	    legend.setAttribute("style", "background-color:"+color_status[x]+"; height: 10px; width :10px");
	    button.setAttribute("onclick", "show_stats('"+x+"')");
	    var name = "";
	    switch (x){
	    case "unknown" : name = "Unknown instructions"; break;
	    case "label" : name = "Unknown label"; break;
	    case "indirect" : name = "Indirect jumps"; break;
	    case "data_unknown" : name = "Data leak - w/ unknown"; break;
	    case "control_unknown" : name = "Control leak - w/ unknown"; break;
	    case "data" : name = "Data leak"; break;
	    case "control" : name = "Control leak"; break;
	    default: name = x.toUpperCase();
	    }
	    button.innerText = name+": "+stats[x];
	    button.appendChild(legend);
	    cell.appendChild(button);
	    row.appendChild(cell);
	}
    }
    table.appendChild(row);
    document.getElementById("buttons").innerText = "Flags used: " + results[results.length-1].flags;
    document.getElementById("buttons").innerText += "\nPress a button to show its elements and toggle the visualization";
    document.getElementById("buttons").appendChild(table);
    show_general();
}

function show_general() { // Draw a table with all the results formatted
    showing = "general";
    document.getElementById("conc_stats").innerHTML = "";
    document.getElementById("data").innerHTML = "";
    document.getElementById("data").appendChild(document.createElement("br"));
    var button = document.createElement("button");
    button.setAttribute("onclick", "sort_rows()");
    button.innerText = "Sort rows";
    document.getElementById("data").appendChild(button);
    var txt = "";
    actual_exp = "";
    actual_comp = "";
    var actual_table = document.createElement("table");
    var actual_row = document.createElement("tr");
    actual_table.setAttribute("border", "1");
    //actual_table.setAttribute("width", "100%");
    results.forEach(function(elem, i) {
	if ( i === results.length-1 || !elem.show){return;} // For last element (summary)
	comp = get_case(elem.name, 1);
	exp = get_case(elem.name, 2);
	mit = get_case(elem.name, 3) ? get_case(elem.name, 3) : elem.entry; //More or less
	if (comp != actual_comp){
	    var title = document.createElement("h2");
	    title.innerText = comp;
	    document.getElementById("data").appendChild(document.createElement("br"));
	    actual_table.appendChild(actual_row);
	    actual_row = document.createElement("tr");
	    document.getElementById("data").appendChild(actual_table);
	    document.getElementById("data").appendChild(title);
	    actual_table = document.createElement("table");
	    actual_table.setAttribute("border", "1");
	    actual_comp = comp;
	    actual_exp = "";
	}
	if (exp != actual_exp){
	    actual_table.appendChild(actual_row);
	    actual_row = document.createElement("tr");
	    var name_row = document.createElement("th");
	    name_row.innerText = exp;
	    actual_row.appendChild(name_row);
	    actual_exp = exp;
	}
	var color = color_status[elem.status];
	var cell = document.createElement("td");
	var contents = document.createElement("a");
	cell.setAttribute("style", "background-color:"+color+";");
	contents.setAttribute("onclick", "show_table("+i+")");
	contents.innerText = "__";
	//contents.innerText = mit;
	cell.appendChild(contents);
	actual_row.appendChild(cell);
    });
    actual_table.appendChild(actual_row);
    document.getElementById("data").appendChild(actual_table);
}


function show_descriptive() { // Draw a table with all the results formatted
    showing = "descriptive";
    document.getElementById("conc_stats").innerHTML = "";
    document.getElementById("data").innerHTML = "";
    document.getElementById("data").appendChild(document.createElement("br"));
    var table = document.createElement("table");
    table.setAttribute("border", "1");
    table.setAttribute("id", "descriptive_table");
    var actual_row = document.createElement("tr");
    var cell = document.createElement("th");
    cell.innerText = "Program";
    actual_row.appendChild(cell);
    for (var prop in results[0]){ // Consider it contains all in order
	if(prop != "entry" && prop != "name" && prop != "show"){
	    cell = document.createElement("th");
	    if (prop == "status" || prop == "total_time") {
		var button = document.createElement("button");
		button.setAttribute("onclick", "sort_descriptive_table('"+prop+"')");
		button.innerText = prop;
		cell.appendChild(button);
	    } else {
		cell.innerText = prop;
	    }
	    actual_row.appendChild(cell);
	}
    }
    table.appendChild(actual_row);
    results.forEach(function(elem, i) {
	if ( i === results.length-1 || !elem.show){return;} // For last element (summary)
	var color = color_status[elem.status];
	actual_row = document.createElement("tr");
	cell = document.createElement("th");
	cell.innerText = elem.name;
	var fun = document.createElement("a");
	fun.setAttribute("style", "color:"+color+";");
	fun.setAttribute("onclick", "show_table("+i+")");
	fun.innerText = elem.entry;
	cell.appendChild(fun);
	actual_row.appendChild(cell);
	var inner_table, inner_row, inner_cell;
	for (var prop in results[i]){
	    val=results[i][prop];
	    switch(prop){
	    case "file":
		cell = document.createElement("td");
		inner_table = document.createElement("table");
		inner_row = document.createElement("tr");
		inner_cell = document.createElement("td");
		var ref = document.createElement("a");
		ref.setAttribute("href", val);
		ref.innerText = "json";
		inner_cell.appendChild(ref);
		inner_row.appendChild(inner_cell);
		inner_table.appendChild(inner_row);
		var out_file = val.split('.').slice(0,-1).join('.')+".out";
		inner_row = document.createElement("tr");
		inner_cell = document.createElement("td");
		ref = document.createElement("a");
		ref.setAttribute("href", elem.name);
		ref.innerText = "src";
		inner_cell.appendChild(ref);
		inner_row.appendChild(inner_cell);
		inner_table.appendChild(inner_row);
		// TODO add C code link
		inner_row = document.createElement("tr");
		inner_cell = document.createElement("td");
		ref = document.createElement("a");
		ref.setAttribute("href", out_file);
		ref.innerText = "log";
		inner_cell.appendChild(ref);
		inner_row.appendChild(inner_cell);
		inner_table.appendChild(inner_row);
		cell.appendChild(inner_table);
		actual_row.appendChild(cell);
		// var err_file = val.split('.').slice(0,-1).join('.')+".err";
		break;
	    case "name":
		break;
	    case "total_time":
		cell = document.createElement("td");
		cell.innerText = val + " ms";
		actual_row.appendChild(cell);
		break;
	    case "paths":
		cell = document.createElement("td");
		inner_table = document.createElement("table");
		inner_row = document.createElement("tr");
		inner_cell = document.createElement("td");
		inner_cell.innerText = val.length;
		inner_row.appendChild(inner_cell);
		inner_table.appendChild(inner_row);
		stats=stats_paths(val); 	    // TODO macro for repeating the work
		inner_row = document.createElement("tr");
		inner_cell = document.createElement("td");
		inner_cell.innerText = "Time symbolic execution: "+stats.trace+" ms";
		inner_row.appendChild(inner_cell);
		inner_table.appendChild(inner_row);
		inner_row = document.createElement("tr");
		inner_cell = document.createElement("td");
		inner_cell.innerText = "Time SNI-checking: "+stats.solve+" ms";
		inner_row.appendChild(inner_cell);
		inner_table.appendChild(inner_row);
		inner_row = document.createElement("tr");
		inner_cell = document.createElement("td");
		inner_cell.innerText = "Unknown ins: "+stats.unknown_ins;
		inner_row.appendChild(inner_cell);
		inner_table.appendChild(inner_row);
		inner_row = document.createElement("tr");
		inner_cell = document.createElement("td");
		inner_cell.innerText = "Unknown labels: "+stats.unknown_labels;
		inner_row.appendChild(inner_cell);
		inner_table.appendChild(inner_row);
		inner_row = document.createElement("tr");
		inner_cell = document.createElement("td");
		inner_cell.innerText = "Steps per path";
		var table_level3 = document.createElement("table");
		table_level3.setAttribute("border", "3");
		table_level3.setAttribute("cellpadding", "3");
		table_level3.setAttribute("cellspacing", "3");
		var cell_table_level3 = document.createElement("td");
		for (var s in stats.steps){
		    cell_table_level3.innerText = s +": "+stats.steps[s];
		    table_level3.appendChild(cell_table_level3);
		    cell_table_level3 = document.createElement("td");
		}
		inner_cell.appendChild(table_level3);
		inner_row.appendChild(inner_cell);
		inner_table.appendChild(inner_row);
		cell.appendChild(inner_table);
		actual_row.appendChild(inner_table);
		break;
	    case "entry":
		break;
	    case "show":
		break;
	    default:
		cell = document.createElement("td");
		cell.innerText = val;
		actual_row.appendChild(cell);
	    }
	}
	table.appendChild(actual_row);
    });
    document.getElementById("data").appendChild(table);
}

function sort_descriptive_table(elem){
    results = results.sort(function(a, b) {
        if (sort_dir) {
            return (a[elem] > b[elem]) ? 1 : ((a[elem] < b[elem]) ? -1 : 0);
        } else {
            return (b[elem] > a[elem]) ? 1 : ((b[elem] < a[elem]) ? -1 : 0);
        }
    });
    sort_dir = !sort_dir;
    show_descriptive();
}

function get_case(exp, n){
    var p = exp.split('/');
    return p[n];
}

function show_table(index) {
    document.getElementById("conc_stats").innerHTML = "";
    document.getElementById("data").innerHTML = "";
    var table = document.createElement("table");
    table.setAttribute("border","1");
    for (var prop in results[index]){
	var row = document.createElement("tr");
	var name = document.createElement("th");
	name.innerText = prop;
	row.appendChild(name);
	var cell = document.createElement("td");
	var ref = document.createElement("a");
	val=results[index][prop];
	switch(prop){
	case "file":
	    ref.setAttribute("href", val);
	    ref.innerText = val;
	    cell.appendChild(ref);
	    row.appendChild(cell);
	    table.appendChild(row);
	    row = document.createElement("tr");
	    name = document.createElement("th");
	    name.innerText = "Log file";
	    row.appendChild(name);
	    cell = document.createElement("td");
	    ref = document.createElement("a");
	    var out_file = val.split('.').slice(0,-1).join('.')+".out";
	    ref.setAttribute("href", out_file);
	    ref.innerText = out_file;
	    cell.appendChild(ref);
	    row.appendChild(cell);
	    break;
	case "name":
	    ref = document.createElement("a");
	    ref.setAttribute("href", val);
	    ref.innerText = val;
	    cell.appendChild(ref);
	    row.appendChild(cell);
	    break;
	case "total_time":
	    cell.innerText = val + " ms";
	    row.appendChild(cell);
	    break;
	case "paths":
	    var inner_table = document.createElement("table");
	    var inner_row = document.createElement("tr");
	    var inner_cell = document.createElement("td");
	    inner_cell.innerText = val.length;
	    inner_row.appendChild(inner_cell);
	    inner_table.appendChild(inner_row);
	    stats=stats_paths(val); 	    // TODO macro for repeating the work
	    inner_row = document.createElement("tr");
	    inner_cell = document.createElement("td");
	    inner_cell.innerText = "Time symbolic execution: "+stats.trace+" ms";
	    inner_row.appendChild(inner_cell);
	    inner_table.appendChild(inner_row);
	    inner_row = document.createElement("tr");
	    inner_cell = document.createElement("td");
	    inner_cell.innerText = "Time SNI-checking: "+stats.solve+" ms";
	    inner_row.appendChild(inner_cell);
	    inner_table.appendChild(inner_row);
	    inner_row = document.createElement("tr");
	    inner_cell = document.createElement("td");
	    inner_cell.innerText = "Unknown ins: "+stats.unknown_ins;
	    inner_row.appendChild(inner_cell);
	    inner_table.appendChild(inner_row);
	    inner_row = document.createElement("tr");
	    inner_cell = document.createElement("td");
	    inner_cell.innerText = "Unknown labels: "+stats.unknown_labels;
	    inner_row.appendChild(inner_cell);
	    inner_table.appendChild(inner_row);
	    inner_row = document.createElement("tr");
	    inner_cell = document.createElement("td");
	    inner_cell.innerText = "Steps per path";
	    var table_level3 = document.createElement("table");
	    table_level3.setAttribute("border", "3");
	    table_level3.setAttribute("cellpadding", "3");
	    table_level3.setAttribute("cellspacing", "3");
	    var cell_table_level3 = document.createElement("td");
	    for (var s in stats.steps){
		cell_table_level3.innerText = s +": "+stats.steps[s];
		table_level3.appendChild(cell_table_level3);
		cell_table_level3 = document.createElement("td");
	    }
	    inner_cell.appendChild(table_level3);
	    inner_row.appendChild(inner_cell);
	    inner_table.appendChild(inner_row);
	    cell.appendChild(inner_table);
	    row.appendChild(inner_table);
	    break;
	default:
	    cell.innerText = val;
	    row.appendChild(cell);
	}
	table.appendChild(row);
    }
    document.getElementById("data").appendChild(table);
}

function stats_paths(paths) {
    var trace = 0;
    var solve = 0;
    var steps = []; // min, avg, max
    var total_steps = 0;
    var unknown_ins = 0;
    var unknown_labels = 0;
    for (var path in paths){
	if( paths[path].time_trace ){
	    trace += paths[path].time_trace;
	    solve += paths[path].time_solve;
	    steps.push(paths[path].steps);
	    total_steps += paths[path].steps;
	    unknown_ins += paths[path].unknown_ins;
	    unknown_labels += paths[path].unknown_labels.length;
	}
    }
    return {trace:trace, solve:solve, steps:{min:Math.min(...steps), avg:total_steps/paths.length, max:Math.max(...steps), total:total_steps}, unknown_ins:unknown_ins, last:paths[(paths.length-1)], unknown_labels:unknown_labels};
}

function stats_results(results) {
    var total = results.length-1;
    var timeout = results.filter(r => r.status == "timeout").length;
    var segfault = results.filter(r => r.status == "segfault").length;
    var unknown_error = results.filter(r => r.status == "unknown_error").length;
    var parsing = results.filter(r => r.status == "parsing").length;
    var parsed = total-parsing;
    var analyzed= parsed-timeout-segfault;
    var unknown = 0;
    var labels = 0;
    var indirect = 0;
    var data_unknown = 0;
    var control_unknown = 0;
    results.forEach(function(elem, i) {
	if(elem.status == "timeout" || elem.status == "segfault" || elem.status == "unknown_error") elem.show=false;
	else elem.show=true;
	if(elem.paths){
	    var st = stats_paths(elem.paths); // If last path is unsafe and doesn't have undefined behavior, mark as normally
	    if (elem.status != "data" && elem.status != "control"){
		if (st.unknown_ins){
		    unknown++;
		    elem.status="unknown";
		} else {if (st.unknown_labels){
		    labels++;
		    elem.status="label";
		} else {if (st.indirect_jumps){
		    indirect++;
		    elem.status="indirect";
		}
		       }}}
	    else {
		if (st.unknown_ins || st.unknown_labels || st.indirect_jumps){
		    switch(elem.status){
		    case "data":
			data_unknown++;
			elem.status="data_unknown";
			break;
		    case "control":
			control_unknown++;
			elem.status="control_unknown";
			break;
		    }
		}}
	}});
    var control = results.filter(r => r.status == "control").length;
    var data = results.filter(r => r.status == "data").length;
    var safe = results.filter(r => r.status == "safe").length;
    var safe_bound = results.filter(r => r.status == "safe_bound").length;
    var complete = analyzed-unknown-labels-indirect;
    return {total:total,
	    analyzed:analyzed,
	    complete:complete,
	    parsing:parsing,
	    timeout:timeout,
	    segfault:segfault,
	    unknown_error:unknown_error,
	    unknown:unknown,
	    label:labels,
	    indirect:indirect,
	    data_unknown:data_unknown,
	    control_unknown:control_unknown,
	    data:data,
	    control:control,
	    safe:safe,
	    safe_bound:safe_bound
	   };
}

function show_stats(st){
    stats = {"times":[], "n_paths":[], "steps":[]};
    results.forEach(function(elem, i) {
	if(elem.status == st) {
	    elem.show = !elem.show;
	    stats.times.push(elem.total_time);
	    if (elem.paths){
		stats.n_paths.push(elem.paths.length);
		for(var path in elem.paths){
		    if(elem.paths[path].steps)
			stats.steps.push(elem.paths[path].steps);
		}
	    }
	}
    });
    var table = document.createElement("table");
    table.setAttribute("border", "2");
    var row = document.createElement("tr");
    var name = document.createElement("th");
    var min = document.createElement("th");
    min.innerText = "Min";
    var avg = document.createElement("th");
    avg.innerText = "Avg";
    var max = document.createElement("th");
    max.innerText = "Max";
    row.appendChild(name);
    row.appendChild(min);
    row.appendChild(avg);
    row.appendChild(max);
    table.appendChild(row);
    for (var x in stats){
	row = document.createElement("tr");
	name = document.createElement("th");
	name.innerText = x;
	min = document.createElement("td");
	min.innerText = Math.min(...stats[x]);
	avg = document.createElement("td");
	avg.innerText = stats[x].reduce(add)/stats[x].length;
	max = document.createElement("td");
	max.innerText = Math.max(...stats[x]);
	row.appendChild(name);
	row.appendChild(min);
	row.appendChild(avg);
	row.appendChild(max);
	table.appendChild(row);
    }
    var title = document.createElement("h3");
    title.innerText = st;
    // var shown = document.createElement("a");
    // shown.innerText = "shown: "+ "false";
    // var button_shown = document.createElement("button");
    // button_shown.innerText = "Hide/show";
    document.getElementById("conc_stats").innerHTML = "";
    document.getElementById("conc_stats").appendChild(title);
    //document.getElementById("conc_stats").appendChild(shown);
    document.getElementById("conc_stats").appendChild(table);
}

function add(accumulator, a) {
    return accumulator + a;
}

function sort_rows(){
    var distinct = [];
    var current_name = "";
    var current_l = [];
    results.forEach(function(elem, i) {
	if(elem.name == current_name) {
	    current_l = current_l.concat(elem);
	} else{
	    console.log(current_l);
	    current_l.sort(function(a, b){ return a.status < b.status; });
	    distinct = distinct.concat(current_l);
	    current_l = [elem];
	    current_name = elem.name;
	}
    });
    current_l.sort(function(a, b){ return a.status < b.status; });
    distinct = distinct.concat(current_l);
    results = distinct;
    show_general();
}

color_status = {
    "safe":"#42f221",
    "safe_bound":"#92c251",
    "data_unknown":"#ee6868",
    "data":"#ff2222",
    "control_unknown":"#dd4030",
    "control":"#aa0011",
    "unsafe":"#d20000",
    "indirect":"#0021ad",
    "label":"#0044cc",
    "unknown":"#0088aa",
    "unknown_error":"#c0c1d0",
    "segfault":"#eeaa00",
    "timeout":"#fabada",
    "parsing":"#cc00ca"
};
