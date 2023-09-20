var elesJson = {
    nodes: [
        { data: { id: 'a', foo: 3, bar: 5, baz: 7 } },
        { data: { id: 'b', foo: 7, bar: 1, baz: 3 } },
        { data: { id: 'c', foo: 2, bar: 7, baz: 6 } },
        { data: { id: 'd', foo: 9, bar: 5, baz: 2 } },
        { data: { id: 'e', foo: 2, bar: 4, baz: 5 } }
    ],

    edges: [
        { data: { id: 'ae', weight: 1, source: 'a', target: 'e' } },
        { data: { id: 'ab', weight: 3, source: 'a', target: 'b' } },
        { data: { id: 'be', weight: 4, source: 'b', target: 'e' } },
        { data: { id: 'bc', weight: 5, source: 'b', target: 'c' } },
        { data: { id: 'ce', weight: 6, source: 'c', target: 'e' } },
        { data: { id: 'cd', weight: 2, source: 'c', target: 'd' } },
        { data: { id: 'de', weight: 7, source: 'd', target: 'e' } }
    ]
    };
var cy = cytoscape({
    container: document.getElementById('cy'), // container to render in

    elements: elesJson,

    style: [ // the stylesheet for the graph
        {
        selector: 'node',
        style: {
            'background-color': '#666',
            'label': 'data(id)'
        }
        },

        {
        selector: 'edge',
        style: {
            'width': 3,
            'line-color': '#ccc',
            'target-arrow-color': '#ccc',
            'target-arrow-shape': 'none',
            'curve-style': 'bezier'
        }
        },
    ],
      ready: function(){
    }
})