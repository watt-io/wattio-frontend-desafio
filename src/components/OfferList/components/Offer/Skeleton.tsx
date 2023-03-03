import Skeleton, { SkeletonProps } from "@mui/material/Skeleton";

const OfferSkeleton = (props: SkeletonProps) => (
  <Skeleton
    {...props}
    variant="rectangular"
    sx={{
      display: "flex",
      flex: 1,
      minWidth: 270,
      height: 155,
      transition: "linear 0.2s",
      cursor: "pointer",
      borderRadius: 2,
    }}
  />
);

export default OfferSkeleton;
