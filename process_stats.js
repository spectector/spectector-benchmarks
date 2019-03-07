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
    document.getElementById("stats").innerText += " of "+stats.total+" files ("+stats.analyzed+" analyzed)";
    txt = "";
    for (var x in stats){
	if (x != "total" && x != "analyzed"){
	    txt += "<td><table>";
	    //txt += "<td><table><tr><td><button style=\"color:"+color_status[x]+"\" id=\"leak\" onclick=\"change_view('"+x+"')\"> "+x.toUpperCase()+": "+stats[x]+"</button></td></tr><tr><td>"+x+"</td></tr></table></td>";
	    txt += "<tr><td><button style=\"color:"+color_status[x]+"\" id=\"leak\" onclick=\"change_view('"+x+"')\"> "+x.toUpperCase()+": "+stats[x]+"</button></td></tr></td></table>";
	}
    }
    document.getElementById("buttons").innerHTML = "Press a button to show/hide its elements and stats:<br><table><tr>" + txt + "</tr></table>";
    show_general(true);
}

function show_general(bool) { // Draw a table with all the results formatted
    showing = bool;
    document.getElementById("conc_stats").innerHTML = "";
    var txt = "";
    if(bool){
	actual_exp = "";
	actual_comp = "";
	// var table = document.createElement("table")
	// table.setAttribute("border", "1")
	// document.body.appendChild(table)
	results.forEach(function(elem, i) {
	    if ( i === results.length-1 || !elem.show){return;} // For last element (summary)
	    comp = get_case(elem.name, 1);
	    exp = get_case(elem.name, 2);
	    mit = get_case(elem.name, 3) ? get_case(elem.name, 3) : elem.entry; //More or less
	    if (comp != actual_comp){
		txt += "<br></table><h2>"+comp+"</h2><table border='1'>";
		actual_comp = comp;
		actual_exp = "";
	    }
	    if (exp != actual_exp){
		txt += "<tr><th>"+exp+"</th>";
		actual_exp = exp;
	    }
	    var color = color_status[elem.status];
	    txt += "<td><a style=\"color:"+color+";\"onclick=\"show_table("+i+")\">"+mit+"</a></td>";
	});
	txt += "</tr>";
	document.getElementById("data").innerHTML = txt;
    } else {
	txt += "<br><table border='1' id=\"descriptive_table\"><tr><th>Program</th>";
	for (var prop in results[0]){ // Consider it contains all in order
	    if(prop != "entry" && prop != "name" && prop != "show"){
	       	txt += "<th>"+ ((prop == "status" || prop == "total_time") ? "<button onclick=\"sort_descriptive_table('"+prop+"')\">"+prop+"</button>" : prop) +"</th>";
	    }
	}
	txt += "</tr>";
	results.forEach(function(elem, i) {
	    if ( i === results.length-1 || !elem.show){return;} // For last element (summary)
	    var color = color_status[elem.status];
	    txt += "<tr><th>"+elem.name+" <a style=\"color:"+color+";\"onclick=\"show_table("+i+")\">"+elem.entry+"</a></th>";
	    for (var prop in results[i]){
		val=results[i][prop];
		switch(prop){
		case "file":
		    txt += "<td><table><tr><td>";
		    txt += "<a href=\""+val+"\">json</a></td></tr>";
		    var out_file = val.split('.').slice(0,-1).join('.')+".out";
		    txt += "<tr><td><a href=\""+results[i].name+"\">src</a></td></tr>";
		    // TODO add C code link
		    txt += "<tr><td><a href=\""+out_file+"\">log</a></td></tr></table></td>";
		    // var err_file = val.split('.').slice(0,-1).join('.')+".err";
		    // txt += "<tr><td><a href=\""+err_file+"\">err</a><td></tr></table></td>";
		    break;
		case "name":
		    break;
		case "total_time":
		    txt += "<td>";
		    txt += val + " ms</td>";
		    break;
		case "paths":
		    txt += "<td><table border\"2\"><tr><td>";
		    txt += val.length + "</td></tr>";
		    stats=stats_paths(val);
		    txt += "<tr><td>Time symbolic execution: "+stats.trace+" ms </td></tr>";
		    txt += "<tr><td>Time SNI-checking: "+stats.solve+" ms </td></tr>";
		    txt += "<tr><td>Unknown ins: "+stats.unknown_ins+"</td></tr>";
		    txt += "<tr><td>Unknown labels: "+stats.unknown_labels+"</td></tr>";
		    // TODO parse an array
		    txt += "<tr><td>Steps per path <table border=\"3\" cellpadding=\"3\" cellspacing=\"3\">";
		    for (var s in stats.steps){
			txt+= "<td>"+s+": "+stats.steps[s]+"</td>";
		    }
		    txt += "</table></td></tr></table>";
		    break;
		case "entry":
		    break;
		case "show":
		    break;
		    default:
			txt += "<td>";
			txt += val + "</td>";
		    }
	    }
	    txt += "</th></tr>";
	});
	
	txt += "</table>";
	document.getElementById("data").innerHTML = txt;
    }
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
    show_general(false);
}

function get_case(exp, n){
    var p = exp.split('/');
    return p[n];
}

function show_table(index) {
    var table = "<table border='1'>";
    for (var prop in results[index]){
	table += "<tr><th>"+prop+":</th><td>";
	val=results[index][prop];
	switch(prop){
	case "file":
	    table += "<a href=\""+val+"\">"+val+"</a></td></tr>";
	    var out_file = val.split('.').slice(0,-1).join('.')+".out";
	    table += "<tr><th>Log file</th><td><a href=\""+out_file+"\">"+out_file+"</a></td></tr>";
	    break;
	case "name":
	    table += "<a href=\""+val+"\">"+val+"</a></td></tr>";
	    break;
	case "total_time":
	    table += val + " ms</td></tr>";
	    break;	  
	case "paths":
	case "paths":
	    table += "<table border\"2\"><tr><td>";
	    table += val.length + "</td></tr>";
	    stats=stats_paths(val);
	    table += "<tr><td>Time symbolic execution: "+stats.trace+" ms </td></tr>";
	    table += "<tr><td>Time SNI-checking: "+stats.solve+" ms </td></tr>";
	    table += "<tr><td>Unknown ins: "+stats.unknown_ins+"</td></tr>";
	    table += "<tr><td>Unknown labels: "+stats.unknown_labels+"</td></tr>";
	    // TODO parse an array
	    table += "<tr><td>Steps per path <table border=\"3\" cellpadding=\"3\" cellspacing=\"3\">";
	    for (var s in stats.steps){
		table+= "<td>"+s+": "+stats.steps[s]+"</td>";
	    }
	    table += "</table></td></tr></table></td></tr>";
	    break;
	default:
	    table += val + "</td></tr>";
	}
    }
    document.getElementById("data").innerHTML = table;
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
    var analyzed = total-timeout-segfault;
    var unknown = 0;
    var labels = 0;
    results.forEach(function(elem, i) {
	if(elem.status == "timeout" || elem.status == "segfault") elem.show=false;
	else elem.show=true;
	if(elem.paths){
	    var st = stats_paths(elem.paths); // If last path is unsafe and doesn't have undefined behavior, mark as normally
	    if (st.unknown_ins){
		unknown++;
		elem.status="unknown";
	    } else {if (st.unknown_labels){
		labels++;
		elem.status="label";
	    }
		   }
	}
    });
    var control = results.filter(r => r.status == "control").length;
    var data = results.filter(r => r.status == "data").length;
    var safe = results.filter(r => r.status == "safe").length;
    return {total:total,
	    timeout:timeout,
	    analyzed:analyzed,
	    data:data,
	    control:control,
	    safe:safe,
	    segfault:segfault,
	    unknown:unknown,
	    label:labels,
	   };
}

function change_view(st){
    stats = {"times":[], "paths_length":[], "steps":[]};
    results.forEach(function(elem, i) {
	if(elem.status == st) {
	    elem.show = !elem.show;
	    stats.times.push(elem.total_time);
	    if (elem.paths){
		stats.paths_length.push(elem.paths.length);
		for(var path in elem.paths){
		    if(elem.paths[path].steps)
			stats.steps.push(elem.paths[path].steps);
		}
	    }
	}
    });
    // var table = document.createElement("table");
    // var name = document.createElement("h3"); name.innerText = st;
    // document.getElementById("conc_stats").appendChild(table);
    show_general(showing);
    var txt = "<table border=\"2\">";
    txt += "<tr><td></td><th>Min</th><th>Avg</th><th>Max</th></tr>";
    for (var x in stats){
	txt += "<tr><th>"+x+"</th><td>" + Math.min(...stats[x]) + "</td>";
	txt += "<td>" + stats[x].reduce(add)/stats[x].length + "</td>";
	txt += "<td>" + Math.max(...stats[x]) + "</td></tr>";
    }
    txt += "</table>";
    document.getElementById("conc_stats").innerHTML = "<h3>"+st+":</h3>" + txt;
}

function add(accumulator, a) {
    return accumulator + a;
}

color_status = {
    "safe":"green",
    "control":"bb0000",
    "data":"ff2020",
    "label":"777777",
    "unknown":"blue",
    "segfault":"bb7700",
    "timeout":"purple",
    "unsafe":"red"
};
