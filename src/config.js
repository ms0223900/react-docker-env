if(!window._env_)
  window._env_ = {}

export const version = window._env_.REACT_APP_VERSION || process.env.REACT_APP_VERSION
export const testEnv = window._env_.REACT_APP_TEST_ENV || process.env.REACT_APP_TEST_ENV