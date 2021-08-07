async function getComponent(name, ext = ".html"): Promise<string> {
  if (!name) throw new Error("컴포넌트 name 이 없습니다.");
  const xhr = new XMLHttpRequest();
  return new Promise((resolve, reject) => {
    xhr.addEventListener("load", () => {
      if (xhr.status === 200) {
        resolve(xhr.responseText);
      } else {
        reject(xhr.statusText);
      }
    });
    xhr.addEventListener("error", (error) => {
      reject(error);
    });
    xhr.open("GET", `${name}${ext}`);
    xhr.send();
  });
}

document.addEventListener("DOMContentLoaded", async () => {
  const componentList = document.querySelectorAll("VanillaComponent");
  for (const element in componentList) {
    const component = componentList[element];
    if (typeof component === "object") {
      const name = component.getAttribute("src").split(".")[0];
      const ext = `.${component.getAttribute("src").split(".")[1] || "html"}`;
      const contents = await getComponent(name, ext);
      component.outerHTML = contents;
    }
  }
});
