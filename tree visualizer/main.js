let dat = [
['T',"000"],
['D',"0010"],
['F',"00110"],
['M',"00111"],
['W',"01000"],
['B',"010010"],
['P',"010011"],
['R',"0101"],
['I',"0110"],
['S',"0111"],
['E',"100"],
['H',"1010"],
['U',"10110"],
['G',"101110"],
['Y',"101111"],
['N',"1100"],
['O',"1101"],
['A',"1110"],
['L',"11110"],
['C',"111110"],
['K',"1111110"],
['X',"111111100"],
['Q',"1111111010"],
['Z',"11111110110"],
['J',"11111110111"],
['V',"11111111"]
  ];

let root = {"name":"","children":[]};

for(let x of dat){
  let curr = root;
  for(let b of x[1]){
    if(b==='0'){
      if(!curr.children[0]){
        curr.children[0] = {"name":curr.name+"0","children":[]};
      }
      curr = curr.children[0];
    }else {
      if(!curr.children[1]){
        curr.children[1] = {"name":curr.name+"1","children":[]};
      }
      curr = curr.children[1];
    }
  }
  curr.value = x[0];
}
// console.log(JSON.stringify(root,null,1));
let tree = d3.hierarchy(root);
let layout = d3.tree();
layout.size([800,600]);
layout(tree);

make(tree);

function link(d) {
	return "M" + d.x + "," + d.y
    + "C" + (d.x + d.parent.x) / 2 + "," + d.y
    + " " + (d.x + d.parent.x) / 2 + "," + d.parent.y
    + " " + d.parent.x + "," + d.parent.y;
}

function make(root) {
	var nodes = d3.select('.nodes')
		.selectAll('g.node')
		.data(root.descendants());

	var enteringNodes = nodes.enter()
		.append('g')
		.classed('node', true)
		.attr('transform', function(d) {
			return 'translate(' + d.x + ',' + d.y + ')';
		});

	enteringNodes
		.append('circle')
		.attr('r', 2);

	enteringNodes
		.append('text')
		.attr('x', 5)
		.attr('y', 4)
		.text(function(d) {
			return d.data.value;
		});

	var links = d3.select('.links')
		.selectAll('path')
		.data(root.descendants().slice(1));

	links.enter()
		.append('path')
		.attr('d', link);
}

