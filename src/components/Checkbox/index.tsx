import { useState } from "react";

const Checkbox = ({ label, cooperative, setSelectedCooperative }: any) => {
  const [isChecked, setIsChecked] = useState(false);
  return (
    <>
      <label className="cooperative_check">
        <input
          type="radio"
          checked={isChecked}
          onChange={() => {
            setSelectedCooperative(cooperative)
            setIsChecked((prev) => !prev)
          }}
        />
        <span></span>
        {label}
      </label>
    </>
  )
}

export default Checkbox