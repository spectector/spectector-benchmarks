/*jshint esversion: 6 */

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
    document.getElementById("leak").innerText += stats.unsafe;
    document.getElementById("secure").innerText += stats.safe;
    document.getElementById("tout").innerText += stats.timeout;
    document.getElementById("unknown").innerText += stats.unknown;
    show_general(true);
}

function show_general(bool) { // Draw a table with all the results formatted
    var txt = "";
    if(bool){
	actual_exp = "";
	actual_comp = "";
	// var table = document.createElement("table")
	// table.setAttribute("border", "1")
	// document.body.appendChild(table)
	results.forEach(function(elem, i) {
	    if ( i === results.length-1){return;} // For last element (summary)
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
	    var color = choose_color(elem);
	    txt += "<td><a style=\"color:"+color+";\"onclick=\"show_table("+i+")\">"+mit+"</a></td>";
	});
	txt += "</tr>";
	document.getElementById("data").innerHTML = txt;
    } else {
	//txt += "<br><table border='1'>";
	txt += "<br><table border='1'><tr><th>Program</th>";
	for (var prop in results[0]){ // Consider it contains all in order
	    if(prop != "entry" && prop != "name"){
	       	txt += "<th>"+prop+"</th>";
	    }
	}
	txt += "</tr>";
	results.forEach(function(elem, i) {
	    if ( i === results.length-1){return;} // For last element (summary)
	    var color = choose_color(elem);
	    if (elem.status != "timeout"){
		txt += "<tr><th>"+elem.name+" <a style=\"color:"+color+";\"onclick=\"show_table("+i+")\">"+elem.entry+"</a></th>";
		for (var prop in results[i]){
		    val=results[i][prop];
		    switch(prop){
		    case "file":
			txt += "<td><table><tr><td>";
			txt += "<a href=\""+val+"\">JSON</a></td></tr>";
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
		// TODO parse an array
			txt += "<tr><td>Steps per path <table border=\"3\" cellpadding=\"3\" cellspacing=\"3\">";
			for (var s in stats.steps){
			    txt+= "<td>"+s+": "+stats.steps[s]+"</td>";
			}
			txt += "</table></td></tr></table>";
			break;
		    case "entry":
			break;
		    default:
			txt += "<td>";
			txt += val + "</td>";
		    }
		}
		txt += "</th></tr>";
	    }
	});
	
	txt += "</table>";
	document.getElementById("data").innerHTML = txt;
    }
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
	    table += val.length + "</td></tr>";
	    stats=stats_paths(val);
	    table += "<tr><th>Time symbolic execution</th><td>"+stats.trace+" ms </td></tr>";
	    table += "<tr><th>Time SNI-checking</th><td>"+stats.solve+" ms </td></tr>";
	    // TODO parse an array
	    table += "<tr><th>Steps per path</th><td><table border=\"3\" cellpadding=\"3\" cellspacing=\"3\">";
	    for (var s in stats.steps){
		table+= "<td>"+s+": "+stats.steps[s]+"</td>";
	    }
	    table += "</table></td></tr>";
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
    for (var path in paths){
	if( paths[path].time_trace ){
	    trace += paths[path].time_trace;
	    solve += paths[path].time_solve;
	    steps.push(paths[path].steps);
	    total_steps += paths[path].steps;
	    unknown_ins += paths[path].unknown_ins;
	}
    }
    return {trace:trace, solve:solve, steps:{min:Math.min(...steps), avg:total_steps/paths.length, max:Math.max(...steps), total:total_steps}, unknown_ins:unknown_ins, last:paths[(paths.length-1)]};
}

function stats_results(results) {
    var total = results.length-1;
    var timeout = results.filter(r => r.status == "timeout").length;
    var analyzed = total-timeout;
    var unsafe = results.filter(r => r.status == "data" || r.status == "control").length;
    var safe = results.filter(r => r.status == "safe").length;
    var unknown = 0;
    results.forEach(function(elem, i) {
	if(!elem.timeout && elem.paths && stats_paths(elem.paths).unknown_ins){
	    unknown++;
	    if(elem.status == "safe") safe-- ;
	    else if(elem.status == "data" || elem.status == "control") safe-- ;
	}
    });
    return {total:total,
	    timeout:timeout,
	    analyzed:analyzed,
	    unsafe:unsafe,
	    safe:safe,
	    unknown:unknown
	   };
}

function choose_color(elem){
    switch(elem.status){
    case "timeout": return "purple";
    default: return (stats_paths(elem.paths).unknown_ins) ? "blue" : elem.status == "safe" ? "green" : "red";
    }
}
