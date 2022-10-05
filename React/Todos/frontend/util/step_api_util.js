export const fetchSteps = () => (
  $.ajax({
    type: "GET",
    url: "api/steps/"
  })
)

export const fetchStep = (step) => (
  $.ajax({
    type: "GET",
    url: `api/steps/${step.id}`
  })
)

export const updateStep = (step) => (
  $.ajax({
    type: "PATCH",
    url: `api/steps/${step.id}`,
    data: {step}
  })
)

export const createStep = (step) => (
  $.ajax({
    type: "POST",
    url: "api/steps/",
    data: step
  })
)

export const destroyStep = (step) => (
  $.ajax({
    type: "DELETE",
    url: `api/steps/${step.id}`
  })
)
