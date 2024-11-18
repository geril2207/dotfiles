function clickDelete() {
  const ytds = document.querySelectorAll('ytd-menu-service-item-renderer')
  const deleteBtn = [...ytds].find(
    (node) => node.data?.icon?.iconType === 'DELETE',
  )

  if (deleteBtn) deleteBtn.click()
}

function clickFirstDropDown() {
  const item = document.querySelector('ytd-playlist-video-renderer')
  const btn = item.querySelector('#button')

  btn.click()
}
const timeout = (delay = 0) =>
  new Promise((resolve) => {
    setTimeout(() => resolve(null), delay)
  })

async function deleteWatchLater() {
  const items = document.querySelectorAll('ytd-playlist-video-renderer')
  for (const item of items) {
    clickFirstDropDown()
    await timeout(0)
    clickDelete()
    await timeout(500)
  }
}
