//! Constructor
SexyGrep = function(args)
{
	this.init(args);
}

//! Implementation
SexyGrep.prototype = 
{
	init : function(args)
	{
		//SexyAPI.windowResize(800,600);
		
	    this.layout = new YAHOO.widget.Layout(
	    { 
			minWidth: 200, 
			units: 
			[ 
				{ position: 'top', height:140, body: 'top' },
				{ position: 'center', body:'center' },
				{ position: 'bottom', height:60, body:'bottom',scroll:true } 
			] 
		});
	            
	    this.layout.render();
	    
	    this.searchProgress = new YAHOO.widget.Panel(args+"-progress",   
		{ 
			width:"240px",  
			fixedcenter:true,  
			close:false,  
			draggable:false,  
			zindex:4, 
			modal:true, 
			visible:false 
		}); 
	 
		this.searchProgress.setHeader("Searching, please wait..."); 
		this.searchProgress.setBody('<img src="assets/rel_interstitial_loading.gif" />'); 
		this.searchProgress.render("center"); 
	            
		var resultsDef = 
		[
            {key:"file", sortable:true, resizeable:true},
            {key:"line", sortable:true, resizeable:true},
            {key:"match", sortable:true, resizeable:true}
        ];
      
        var resultsSource = new YAHOO.util.DataSource([]);      
        resultsSource.responseType = YAHOO.util.DataSource.TYPE_JSARRAY;
        resultsSource.responseSchema = 
        {
            fields: ["file","line","match"]
        };
        
        var config = 
        {
	        scrollable:true,
	        width:"100%",
    		paginator : new YAHOO.widget.Paginator(
    		{
        		rowsPerPage: 50,
        		totalRecords: 0,
 
        		// use an existing container element
	        	containers: args+"-pagination",
 
	        	// use a custom layout for pagination controls
	        	template: "{PageLinks} Show {RowsPerPageDropdown} per page",
 	
	        	// show all links
	        	pageLinks: YAHOO.widget.Paginator.VALUE_UNLIMITED,
	 	
	        	// use these in the rows-per-page dropdown
	        	rowsPerPageOptions: [25, 50, 100],
	 	
	        	// use custom page link labels
	        	pageLabelBuilder: function (page,paginator) 
	        	{
	        	    var recs = paginator.getPageRecords(page);
	        	    return (recs[0] + 1) + ' - ' + (recs[1] + 1);
        		}
    		})
		};
 
 		this.id = args;
        this.results = new YAHOO.widget.DataTable(args+"-results",resultsDef,resultsSource,config);
        this.resultsCount = 0;
        this.text = "";
        this.filter = "";
        this.dir = "";
        this.recursive = false;
        
        // Process Arguments
        var args = SexyAPI.getArgs();
        if( args && args.length == 2 )
        {
        	this.setDirectory(args[1]);
        }
	},
	_search : function()
	{	       	
		var cmd = "";
		if( this.recursive )
		{
			var src_dir = (this.dir)?this.dir:".";
			var filter = ((this.filter)?" -name '"+this.filter+"'":"");
			
			cmd = "find "+src_dir+filter+" | xargs ";
		}
		cmd+= "grep -n "+this.text;
		if(!this.recursive)
		{
			cmd+=" "+((this.filter)?this.filter:"*");
		}	
        
        var results = SexyAPI.exec("/bin/bash -c \""+cmd+"\"",this.dir);
        //SexyAPI.alert(results);
        
        for(i=0;i<results.length;i++)
        {
           var item = results[i].split(":");
           if(!item || !item.length)
            	continue;
            
           try
           {
           		this.results.addRow({file:item[0],
           							line:item[1],
           							match:item[2]});
           							
           		this.resultsCount++;
           		
           }catch(err){}
        }
        
        this.searchProgress.hide();
	},
	search : function()
	{
		if(!this.text)
			return;
			
		this.searchProgress.show();
		
		this.results.deleteRows(0,this.resultsCount);
		this.resultsCount = 0;
		
		setTimeout("SexyGrep.getInstance()._search()",1000);
	},
	setText : function(txt)
	{
		this.text = txt;
	},
	setFilter : function(fil)
	{
		this.filter = fil;
	},
	setDirectory : function(dir)
	{
		this.dir = (dir)?dir:SexyAPI.getDirectory();
		this.getEl(this.id+"-in").value = this.dir;
	},
	setRecursive : function(state)
	{
		this.recursive = state;
	},
	count : function()
	{
		return this.resultsCount;
	},
	getEl : function(id)
	{
		return document.getElementById(id);
	}
}

//! Single Instance
SexyGrep.__instance__ = null;
SexyGrep.getInstance = function(args)
{
	if(SexyGrep.__instance__ == null)
		SexyGrep.__instance__ = new SexyGrep(args);
		
	return SexyGrep.__instance__;
}
