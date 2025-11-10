/*!
 * BetTrackr Chrome Extension (c) 2025 BetTrackr Pty Ltd
 * Licensed for use with a valid BetTrackr account only.
 * Reverse engineering or modification is prohibited.
 */
const dev={bookmaker_name:async function(t){return"dev"},pages:{"*":{button:'[data-automation-id="betslip-multi-DBL"],',filter:function(t){},fields:{bet_type:async function(t){return t.getParentContainer$(),"Qualifying Bet"},stake:async function(t){return getFirstMatchText(t.getParentContainer$(),['[data-test="card-footer-stake"]'])},odds:async function(t){return getFirstMatchText(t.getParentContainer$(),['[data-test="card-footer-stake"]'])},selection:async function(t){t.getParentContainer$()},date_placed:async function(t){return t.getParentContainer$(),""},status:async function(t){return t.getParentContainer$(),"Pending"},date_resulted:async function(t){return t.getParentContainer$(),""},bookmaker_internal_id:async function(t){return t.getParentContainer$(),""}}}}};