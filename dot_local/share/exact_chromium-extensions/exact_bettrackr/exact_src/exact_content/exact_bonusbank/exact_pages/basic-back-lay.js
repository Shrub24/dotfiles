/*!
 * BetTrackr Chrome Extension (c) 2025 BetTrackr Pty Ltd
 * Licensed for use with a valid BetTrackr account only.
 * Reverse engineering or modification is prohibited.
 */
function processBackLay(t){const a=$("#stake").val(),e=$("#back-odds").val(),o=$("#lay-odds").val(),c=$("#lay-commision").val()+"%",l=$("#lay-stake").text(),n=new Date,r=`${n.getDate()}-${n.getMonth()+1}-${n.getFullYear()}`;return a&&e&&o&&l?`${r}\t\t\t\t\t\t${a}\t${e}\t${l}\t${o}\t${c}`:""}async function runBackLayCalculator(){waitForElement("#results-calculator .form-group:last-child",(t=>{addBetTrackrButton(t,1,"BL","mt-2 mb-4",processBackLay,[],(function(){return $("#cmode option:selected").text()}),[])}))}