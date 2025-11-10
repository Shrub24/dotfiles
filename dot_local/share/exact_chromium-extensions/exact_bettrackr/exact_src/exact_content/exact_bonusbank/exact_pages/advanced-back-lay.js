/*!
 * BetTrackr Chrome Extension (c) 2025 BetTrackr Pty Ltd
 * Licensed for use with a valid BetTrackr account only.
 * Reverse engineering or modification is prohibited.
 */
function processAdvancedBackLay(t,e){const a=$("#stake").val(),r=$("#back-odds").val(),c=$("#lay-odds").val(),n=$("#lay-commission").val()+"%",o=$("#"+e).text();if(!(a&&r&&c&&o))return"";const d=new Date;return`${d.getDate()}-${d.getMonth()+1}-${d.getFullYear()}\t\t\t\t\t\t${a}\t${r}\t${o}\t${c}\t${n}`}async function runAdvancedBackLay(){const t=$(".result-label").filter(((t,e)=>"Copy Bet Tracker Row"===$(e).text().trim())),e={"copy-bettracker-adv-under":"UnderlayStake","copy-bettracker-adv-standard":"StandardStake","copy-bettracker-adv-over":"OverlayStake","copy-bettracker-adv-custom":"CustomStake"};$(t).each(((t,a)=>{addBetTrackrButton($(a),t,"BL","mt-2 mb-4",(()=>{const t=$(a).next().attr("id");return processAdvancedBackLay(a,e[t])}),[],(()=>$("#cmode option:selected").text()),[])}))}