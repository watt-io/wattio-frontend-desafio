import CircularProgress, {
  CircularProgressProps,
} from "@mui/material/CircularProgress";
import Typography from "@mui/material/Typography";
import Box from "@mui/material/Box";

const ProgressBarLabel = (props: CircularProgressProps & { value: number }) => {
  return (
    <Box
      sx={{
        position: "relative",
        display: "inline-flex",
      }}
    >
      <CircularProgress variant="determinate" slot="red" {...props} />
      <Box
        sx={{
          top: 0,
          left: 0,
          bottom: 0,
          right: 0,
          position: "absolute",
          display: "flex",
          alignItems: "center",
          justifyContent: "center",
        }}
      >
        <Typography fontSize="0.6rem" fontWeight="bold" component="div">
          {props.value}%
        </Typography>
      </Box>
    </Box>
  );
};

export default ProgressBarLabel;
