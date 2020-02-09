module.exports = async function(context, myQueueItem) {
  context.log(
    "JavaScript queue trigger function processed work item",
    myQueueItem
  );

  await snooze(2 * 1000);

  var today = new Date();
  var date =
    today.getFullYear() + "-" + (today.getMonth() + 1) + "-" + today.getDate();
  var time =
    today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
  var dateTime = date + " " + time;

  context.log("completed processing the queue message at " + dateTime);
};

const snooze = ms => new Promise(resolve => setTimeout(resolve, ms));
