window.__e=[]; window.onerror=function(m,u,l){window.__e.push(m+' @'+l);};
setTimeout(function(){
  var r=[];
  var sel=document.getElementById('j-native')||document.getElementById('j');
  var f=document.getElementById('the-form');
  r.push('options='+(sel&&sel.options?sel.options.length:0));
  var c=document.getElementById('globe'), lit=0;
  if(c&&c.getContext){var d=c.getContext('2d').getImageData(0,0,c.width,c.height).data;
    for(var i=3;i<d.length;i+=4){if(d[i]>8)lit++;}}
  r.push('globepx='+lit);
  r.push('combo='+(document.querySelector('.cbx-in')?1:0));
  r.push('steps='+document.querySelectorAll('.stepbar i').length);
  r.push('visiblestep='+document.querySelectorAll('form.stepped fieldset.on').length);
  var nx=document.getElementById('st-next'); if(nx) nx.click();
  r.push('blockedwithoutanswer='+(document.querySelector('.err').textContent.trim()?1:0));
  var bad=0,n=0;
  for(var i=1;i<sel.options.length;i++){
    ['platform','self','none'].forEach(function(u){
      sel.value=sel.options[i].value;
      f.querySelector('input[name=use][value='+u+']').checked=true;
      f.querySelector('input[name=past][value=gaps]').checked=true;
      f.dispatchEvent(new Event('submit',{cancelable:true,bubbles:true}));
      n++;
      var h=document.getElementById('result').innerHTML;
      if(h.length<300||/undefined|NaN/.test(h)) bad++;
    });
  }
  r.push('combos='+n); r.push('bad='+bad);
  sel.value='gb';
  f.querySelector('input[name=use][value=platform]').checked=true;
  f.dispatchEvent(new Event('submit',{cancelable:true,bubbles:true}));
  r.push('readout='+(document.getElementById('cd')?1:0));
  r.push('filters='+document.querySelectorAll('.tlf [data-filter]').length);
  var rows=document.querySelectorAll('.tl-row').length;
  var you=document.querySelector('.tlf [data-filter=you]'); if(you) you.click();
  r.push('rows='+rows+' afteryoufilter='+[].slice.call(document.querySelectorAll('.tl-row')).filter(function(x){return !x.hidden;}).length);
  r.push('errors='+(window.__e.length?window.__e.join('; '):'none'));
  document.title='RESULT '+r.join(' ');
},1400);
